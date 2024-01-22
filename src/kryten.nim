
# Smegheads and code enthusiasts, unite! It's time to 
# boldly go where no code has gone before.

# Welcome aboard, and may your commits be as epic as Lister's 
# guitar solos!

import docopt

import database

when isMainModule:
  if database.initNecessary():
    database.initDatabase()

  let doc = """
  Kryten

  Usage:
    kryten ask <filepath> question <question>
  """
    
  let args = docopt(doc, version = "Kryten 0.1.0")

  if args["ask"] and args["question"]:
    echo args["<filepath>"]  
    echo args["<question>"]