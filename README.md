# Kryten

<img src="https://github.com/sergiotapia/kryten/assets/686715/a467adad-e284-40e9-b71e-7e8153eb2bd5" width="200" />

Kryten is a CLI tool to help you easily ask questions and get clear
sourced answers directly from your documents.

```
./kryten ask ~/directives.pdf question "What is Space Core Directive 997?"

Work done by an officer's doppleganger in a parallel universe cannot be 
claimed as overtime. (directives.pdf, page 1)
```

## Goals:

Kryten is portable, snappy, and works across all platforms with
minimal resource usage. For real.

- **CLI only**
- Tiny footprint: Kryten is only 125Kb.
- SQLite for portability and easy backups.
- Ask any question you want.
- Show your chat history for a single file.
- Show your chat history across all files.
- Documents are cached so questions are snappy.
- Run without ceremony. No need for configurations.

My intent is for Kryten to be used by other apps to power their RAG workflows.

## Usage Guide:

Call the `kryten` binary.

```
./kryten ask ~/directives.pdf question "What is Space Core Directive 997?"

Work done by an officer's doppleganger in a parallel universe cannot be 
claimed as overtime. (directives.pdf, page 1)
```

## Requirements:

### OpenAI for ChatPGT

You can create your own API key here: https://platform.openai.com/api-keys

### Pinecone Serverless for Vector Database RAG.

<img width="1200" alt="Screenshot 2024-01-22 at 8 56 10 PM" src="https://github.com/sergiotapia/kryten/assets/686715/ed3a130f-3f92-4f76-8d3c-30ad3beaf6b6">

<img width="1201" alt="Screenshot 2024-01-22 at 8 56 58 PM" src="https://github.com/sergiotapia/kryten/assets/686715/796f9a3f-7bdf-451d-ab09-ae91763fc1b9">

<img width="1439" alt="Screenshot 2024-01-22 at 9 02 52 PM" src="https://github.com/sergiotapia/kryten/assets/686715/ec41e977-5249-44b9-9874-195075d85f50">

<img width="317" alt="Screenshot 2024-01-22 at 9 10 09 PM" src="https://github.com/sergiotapia/kryten/assets/686715/c086f347-fb61-4568-bfc4-d208052e9a21">

### Java Runtime to run Tika App.

Tika App is used to extract the content of your documents. You'll
need the Java Runtime Environment installed on your machine so this
can run properly.

## Local Development:

```
nimble install
nimble build && ./kryten ask ~/directives.pdf question "What is Space Core Directive 196156?"
```

## Contributing:

TODO
