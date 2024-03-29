import std/envvars
import std/httpclient
import std/json
import std/os
import std/strformat

proc generateEmbeddings*(text: string): seq[float] =
  sleep(200)
  const openai_api_key = getEnv("OPENAI_API_KEY")
  const url = "https://api.openai.com/v1/embeddings"

  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Authorization": &"Bearer {openai_api_key}"})

  let body = %*{
      "input": text,
      "model": "text-embedding-ada-002"
  }
  
  let response = client.request(url, httpMethod = HttpPost, body = $body)
  var json =  parseJson(response.body)
  var embeddings = to(json["data"][0]["embedding"], seq[float])

  client.close()

  return embeddings

proc answerQuestionWithRag*(question: string, ragContext: JsonNode): string =
  sleep(200)
  let prompt = fmt"""
  Use the information below to answer my question. 

  Filename: {ragContext["filename"]}
  Page Number: {ragContext["page_number"]}
  Context is below: 
    
  {ragContext["raw_text"]}

  ---
  
  Cite the filename, page number and directly quote the answer from 
  the context. Format the answer nicely using simple to understand 
  language.

  You MUST use this response format exactly:

      Your refridgerator uses a CF8 filter.
      Source: manual.pdf, page 1
  """

  const openai_api_key = getEnv("OPENAI_API_KEY")
  const url = "https://api.openai.com/v1/chat/completions"

  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json", "Authorization": &"Bearer {openai_api_key}"})

  let body = %*{
    "model": "gpt-3.5-turbo",
    "messages": [
      {
        "role": "system",
        "content": prompt
      },
      {
        "role": "user",
        "content": question
      },
    ]
  }
  
  let response = client.request(url, httpMethod = HttpPost, body = $body)
  var json =  parseJson(response.body)
  return to(json["choices"][0]["message"]["content"], string)
