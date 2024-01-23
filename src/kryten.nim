
# Smegheads and code enthusiasts, unite! It's time to 
# boldly go where no code has gone before.

# Welcome aboard, and may your commits be as epic as Lister's 
# guitar solos!

import std/envvars
import std/strutils
import docopt

import database
import files
import openai

when isMainModule:
  type EnvironmentError* = object of ValueError

  if len(getEnv("OPENAI_API_KEY")) == 0:
    raise EnvironmentError.newException("Environment variable $OPENAI_API_KEY is not set.")

  discard generateEmbeddings("test")

  # if database.initNecessary():
  #   database.initDatabase()

  # let doc = """
  # Kryten

  # Usage:
  #   kryten ask <filepath> question <question>
  # """
    
  # let args = docopt(doc, version = "Kryten 0.1.0")

  # if args["ask"] and args["question"]:
  #   var filepath = $args["<filepath>"] 
  #   var contents = extractContents(filepath)
  
  #   echo contents
  #   echo filepath

    # TODO: Check if embeddings exist for this filepath on Pinecone.
      
      # TODO: Chop up contents, generate embeddings, and insert
      # into Pinecone DB with metadata about the filepath.

    # TODO: Generate embeddings for the question, and query
    # Pinecone DB for the most similar embeddings where filepath
    # is the same.

    # TODO: Return the most similar embeddings to pass in as context.

    # TODO: Send the matching context and the question to ChatGPT API.

    # TODO: Save question and answer for filepath in sqlite database.
