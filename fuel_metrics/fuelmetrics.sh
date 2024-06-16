#!/bin/bash

# node_exporter metrics file path
metrics_file="/usr/local/metrics/node_exporter_metrics.prom"

# Obtain fuel height
response=$(curl -s -X POST http://0.0.0.0:5000/v1/graphql \
  -H "Content-Type: application/json" \
  -d '{"query": "{ chain { latestBlock { id height } } }"}')

# Print the response for debugging
echo "Response: $response"

# Parse the response using jq
height=$(echo "$response" | jq -r '.data.chain.latestBlock.height')
block_id=$(echo "$response" | jq -r '.data.chain.latestBlock.id')

# Print the parsed values for debugging
echo "Height: $height"
echo "Block ID: $block_id"

# Define HELP and TYPE for height and block id
help_comment_height="# HELP fuel_height Fuel node block height"
type_comment_height="# TYPE fuel_height gauge"

help_comment_id="# HELP fuel_block_id Fuel node block id"
type_comment_id="# TYPE fuel_block_id gauge"

# Overwrite the metrics file with the new data
{
    echo "$help_comment_height"
    echo "$type_comment_height"
    echo "fuel_height{block_id=\"$block_id\"} $height"
    echo "$help_comment_id"
    echo "$type_comment_id"
    echo "fuel_block_id{block_id=\"$block_id\"} 1"
} > "$metrics_file"
