
# Smegheads and code enthusiasts, unite! It's time to 
# boldly go where no code has gone before.

# Welcome aboard, and may your commits be as epic as Lister's 
# guitar solos!

import std/envvars
import std/strformat
import docopt

import database
import files
import openai
import pinecone

when isMainModule:
  type EnvironmentError* = object of ValueError

  if len(getEnv("OPENAI_API_KEY")) == 0:
    raise EnvironmentError.newException("Environment variable $OPENAI_API_KEY is not set.")

  if len(getEnv("PINECONE_API_KEY")) == 0:
    raise EnvironmentError.newException("Environment variable $PINECONE_API_KEY is not set.")

  if len(getEnv("PINECONE_ENDPOINT")) == 0:
    raise EnvironmentError.newException("Environment variable $PINECONE_ENDPOINT is not set.")

  if database.initNecessary():
    database.initDatabase()

  let doc = """
  Kryten

  Usage:
    kryten ask <filepath> question <question>
  """
    
  let args = docopt(doc, version = "Kryten 0.1.0")

  if args["ask"] and args["question"]:
    var filepath = $args["<filepath>"] 

    if prefixExists(filepath) == false:
      var contents = extractContents(filepath)      
      for content in contents:
        echo &"Generating embedding for {filepath}: Page #{content.pageNumber}"
        var embeddings = generateEmbeddings(content.text)        
        upsertEmbeddings(filepath, content.pageNumber, content.text, embeddings)
    
    var question = $args["<question>"]
    var questionEmbeddings = generateEmbeddings(question)
    var ragContext = searchEmbeddings(filepath, questionEmbeddings)

    let answer = answerQuestionWithRag(question, ragContext)
    echo answer

    # TODO: Save question and answer for filepath in sqlite database.
