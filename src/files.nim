import std/osproc
import std/strutils

type
  DocumentPage = object
    text: string
    page_number: int

proc extractContents*(filepath: string): seq[DocumentPage] =
  let raw_html = execProcess("java -jar ./vendors/tika-app-3.0.0-BETA.jar " & repr(filepath))
  let body = raw_html.split("<body>")[1].split("</body>")[0]
  let body_without_tags = body.replace("<p>", "").replace("</p>", "").replace("<div>", "").replace("</div>","").replace("<p />","").replace("<p/>","")
  let text_pages = body_without_tags.split("""<div class="page">""")[1..^1]
  var pages: seq[DocumentPage]
  for page, text in text_pages.pairs:
    pages.add(DocumentPage(text: text, page_number: page + 1))

  return pages
