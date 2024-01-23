import std/envvars
import std/httpclient
import std/json
import std/strformat

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
  let json =  parseJson(response.body)
  return json["matches"][0]["metadata"]

  client.close()

proc upsertEmbeddings*(filename: string, page_number: int, raw_text: string, embeddings: seq[float]): void =
  const pinecone_api_key = getEnv("PINECONE_API_KEY")
  const pinecone_endpoint = getEnv("PINECONE_ENDPOINT")
  const url = &"{pinecone_endpoint}/vectors/upsert"

  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Api-Key": pinecone_api_key})

  let body = %*{
    "vectors": %*{
      "id": filename,
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
  