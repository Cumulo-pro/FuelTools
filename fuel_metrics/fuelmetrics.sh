#!/bin/bash

# node_exporter metrics file path
metrics_file="/usr/local/metrics/node_exporter_metrics.prom"

# Obtain fuel height
response=$(curl -X POST http://0.0.0.0:5000/v1/graphql \
  -H "Content-Type: application/json" \
  -d '{"query": "{ chain { latestBlock { id height } } }"}')

height=$(echo "$response" | jq -r '.data.chain.latestBlock.height')
block_id=$(echo "$response" | jq -r '.data.chain.latestBlock.id')

# Define HELP and TYPE for height
help_comment_height="# HELP fuel_height Fuel node block height"
type_comment_height="# TYPE fuel_height gauge"

# Define HELP and TYPE for block id (as label)
help_comment_id="# HELP fuel_block_id Fuel node block id"

# Overwrite the metrics file with the new data
{
    echo "$help_comment_height"
    echo "$type_comment_height"
    echo "fuel_height $height"
    echo "$help_comment_id"
    echo "fuel_block_info{block_id=\"$block_id\"} $height"
} > "$metrics_file"
