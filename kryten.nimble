# Package

version       = "0.1.0"
author        = "Sergio Tapia"
description   = "Kryten is a CLI tool to ask questions and get sourced answers from any .pdf, .doc, .docx, and many more documents."
license       = "MIT"
srcDir        = "src"
bin           = @["kryten"]


# Dependencies

requires "nim >= 2.0.2"
requires "db_connector >= 0.1.0"
requires "docopt >= 0.6.7"