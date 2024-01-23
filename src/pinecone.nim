import std/envvars
import std/httpclient
import std/json
import std/strformat
import std/uri

proc prefixExists*(prefix: string): bool =
  const pinecone_api_key = getEnv("PINECONE_API_KEY")
  const pinecone_endpoint = getEnv("PINECONE_ENDPOINT")

  # `false` makes the spaces in the prefix `%20` instead of `+`.
  let prefix = encodeUrl(prefix, false)    
  let url = &"{pinecone_endpoint}/vectors/list?prefix={prefix}&limit=1"
  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Api-Key": pinecone_api_key})

  let response = client.request(url, httpMethod = HttpGet)
  client.close()
  let json = parseJson(response.body)    

  if json["vectors"].len > 0:
    return true
  else:
    return false

proc searchEmbeddings*(filename: string, embeddings: seq[float]): JsonNode =
  const pinecone_api_key = getEnv("PINECONE_API_KEY")
  const pinecone_endpoint = getEnv("PINECONE_ENDPOINT")
  const url = &"{pinecone_endpoint}/query"

  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Api-Key": pinecone_api_key})

  let body = %*{
    "vector": embeddings,
    "topK": 2,
    "includeValues": false,
    "includeMetadata": true,
    "filter": %*{
      "filename": %*{
        "$eq": filename
      }
    }
  }

  let response = client.request(url, httpMethod = HttpPost, body = $body)
  client.close()
  let json =  parseJson(response.body)
  return json["matches"][0]["metadata"]  

proc upsertEmbeddings*(filename: string, page_number: int, raw_text: string, embeddings: seq[float]): void =
  const pinecone_api_key = getEnv("PINECONE_API_KEY")
  const pinecone_endpoint = getEnv("PINECONE_ENDPOINT")
  const url = &"{pinecone_endpoint}/vectors/upsert"

  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Api-Key": pinecone_api_key})

  let body = %*{
    "vectors": %*{
      "id": &"{filename}#chunk{page_number}",
      "values": embeddings,
      "metadata": %*{
        "filename": filename,
        "raw_text": raw_text,
        "page_number": page_number
      }
    }
  }
  
  discard client.request(url, httpMethod = HttpPost, body = $body)
  client.close()  
  