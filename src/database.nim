import db_connector/db_sqlite
import std/envvars
import std/strutils

proc initNecessary*(): bool =
  return getEnv("NUKE_MY_DATABASE", "false").parseBool()

proc initDatabase*(): void =
  echo "Initializing Kryten's SQLite database..."
  let db = open("kryten-data.db", "", "", "")  
  
  db.exec(sql"PRAGMA case_sensitive_like = true;")
  db.exec(sql"PRAGMA encoding = 'UTF-8';")

  db.exec(sql"DROP TABLE IF EXISTS documents;")
  db.exec(sql"CREATE TABLE documents (id INTEGER PRIMARY KEY, filename TEXT);")
  db.exec(sql"CREATE UNIQUE INDEX filename_index on documents(filename);")