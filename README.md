# Kryten

<img src="https://github.com/sergiotapia/kryten/assets/686715/a467adad-e284-40e9-b71e-7e8153eb2bd5" width="200" />

Kryten is a CLI tool to help you easily ask questions and get clear
sourced answers directly from your documents.

```
./kryten ask ~/directives.pdf question "What is Space Core Directive 196156?"

The directive states that any officer caught sniffing the saddle of the exercise
bicycle in the women's gym will be discharged without trial.
```

## Goals:

Kryten is portable, snappy, and works across all platforms with
minimal resource usage. For real.

- **CLI only**
- SQLite for portability and easy backups.
- Ask any question you want.
- Show your chat history for a single file.
- Show your chat history across all files.
- Documents are cached so questions are snappy.
- Run without ceremony. No need for configurations.

## Usage Guide:

Call the `kryten` binary.

```
./kryten ask ~/directives.pdf question "What is Space Core Directive 196156?"

The directive states that any officer caught sniffing the saddle of the exercise
bicycle in the women's gym will be discharged without trial.
```

## Requirements:

### OpenAI for ChatPGT

TODO: Write guide how to get your OpenAI API key.

### Pinecone for Vector Database RAG.

TODO: Add screenshots

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
