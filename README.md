# Kryten

<img src="https://github.com/sergiotapia/kryten/assets/686715/a467adad-e284-40e9-b71e-7e8153eb2bd5" width="200" />

Kryten is a CLI tool to help you easily ask questions and get clear
sourced answers directly from your documents.

Call it through your shell, give it a filepath, and ask a question.

You will get a nice answer, and a nice source citation telling you where
that answer came from.

### Goals:

Kryten is portable, snappy, and works across all platforms with
minimal resource usage. For real.

- **CLI only**
- SQLite for portability and easy backups.
- Ask any question you want.
- Show your chat history for a single file.
- Show your chat history across all files.
- Documents are cached so questions are snappy.
- Run without ceremony. No need for configurations.

### Usage Guide:

You need three things for Kryten to be able to work:

- An OpenAI API key.
- A Pinecone.io vector database.
- The Java Runtime so Tika can extract document text.

### Local Development

```
nimble install
nimble build && ./kryten ask ~/Downloads/example.pdf question "What is Space Core Directive 196156?"
```

### Contributing:

TODO
