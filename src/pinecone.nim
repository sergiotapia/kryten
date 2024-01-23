proc search*(filename: string, embeddings: seq[float]): string =
  # curl -X POST "https://YOUR_INDEX_ENDPOINT/query" \
  # -H "Api-Key: YOUR_API_KEY" \
  # -H 'Content-Type: application/json' \
  # -d '{
  #   "namespace": "ns1",
  #   "vector": [0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3],
  #   "topK": 2,
  #   "includeValues": true,
  #   "includeMetadata": true,
  #   "filter": {"genre": {"$eq": "action"}}
  # }'

  # Query Pinecone using the metadata: filename, and embeddings.
  # Return the pure text of the top result. This is the RAG context
  # we need to send to the ChatGPT model.
  return "test"

proc upsert*(filename: string, embeddings: seq[float]): void =
  # curl -X POST "https://YOUR_INDEX_ENDPOINT/vectors/upsert" \
  # -H "Api-Key: YOUR_API_KEY" \
  # -H 'Content-Type: application/json' \
  # -d '{
  #   "vectors": [
  #     {
  #       "id": "vec1", 
  #       "values": [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1],
  #       "metadata": {"genre": "drama"}
  #     },
  #     {
  #       "id": "vec2", 
  #       "values": [0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2],
  #       "metadata": {"genre": "action"}
  #     },
  #     {
  #       "id": "vec3", 
  #       "values": [0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3],
  #       "metadata": {"genre": "drama"}
  #     },
  #     {
  #       "id": "vec4", 
  #       "values": [0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4],
  #       "metadata": {"genre": "action"}
  #     }
  #   ],
  #   "namespace": "ns1"
  # }'

  # Upsert the embeddings and associate it with the metadata: filename
  # on Pinecone.