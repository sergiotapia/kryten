import std/osproc

proc extractContents*(filepath: string): string =
  execProcess("java -jar ./vendors/tika-app-3.0.0-BETA.jar -t " & repr(filepath))