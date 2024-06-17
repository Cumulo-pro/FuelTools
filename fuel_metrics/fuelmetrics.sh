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

response_version=$(curl -s -X POST http://0.0.0.0:5000/v1/graphql \
  -H "Content-Type: application/json" \
  -d '{"query": "{ nodeInfo { nodeVersion } }"}')

# Parse the response using jq
node_version=$(echo "$response_version" | jq -r '.data.nodeInfo.nodeVersion')

# Convert node version to numeric value
node_version_numeric=$(echo "$node_version" | awk -F. '{print $1 "." $2 $3}')

help_comment_version="# HELP fuel_node_version Fuel node version"
type_comment_version="# TYPE fuel_node_version gauge"

# Obtain fuel health
response_health=$(curl -s -X POST http://0.0.0.0:5000/v1/graphql \
  -H "Content-Type: application/json" \
  -d '{"query": "{ health }"}')

# Parse the response using jq
health=$(echo "$response_health" | jq -r '.data.health')

# Convert health to 1 if true or 0 if false
health_value=0
if [ "$health" = "true" ]; then
  health_value=1
fi

# Define HELP and TYPE for health
help_comment_health="# HELP fuel_health Fuel node health status"
type_comment_health="# TYPE fuel_health gauge"
  
# Overwrite the metrics file with the new data
{
    echo "$help_comment_height"
    echo "$type_comment_height"
    echo "fuel_height $height"
    echo "$help_comment_id"
    echo "$type_comment_id"
    echo "fuel_block_id{block_id=\"$block_id\"} $height"
     echo "$help_comment_version"
    echo "$type_comment_version"
     echo "fuel_node_version $node_version_numeric"
     echo "$help_comment_health"
    echo "$type_comment_health"
     echo "fuel_health $health_value"
} > "$metrics_file"
