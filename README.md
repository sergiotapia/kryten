# Kryten

<img src="https://github.com/sergiotapia/kryten/assets/686715/a467adad-e284-40e9-b71e-7e8153eb2bd5" width="200" />

Kryten is a CLI tool to help you easily ask questions and get clear
sourced answers directly from your documents.

```
./kryten ask ~/directives.pdf question "What is Space Core Directive 196156?"

The directive states that any officer caught sniffing the saddle of the exercise
bicycle in the women's gym will be discharged without trial.
```

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

Then call the `kryten` binary.

```
./kryten ask ~/directives.pdf question "What is Space Core Directive 196156?"

The directive states that any officer caught sniffing the saddle of the exercise
bicycle in the women's gym will be discharged without trial.
```

### Local Development

```
nimble install
nimble build && ./kryten ask ~/directives.pdf question "What is Space Core Directive 196156?"
```

### Contributing:

TODO
