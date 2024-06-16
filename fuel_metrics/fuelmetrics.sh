#!/bin/bash

# node_exporter metrics file path
metrics_file="/usr/local/metrics/node_exporter_metrics.prom"

# Obtain fuel height
height=$(curl -X POST http://0.0.0.0:5000/v1/graphql \
  -H "Content-Type: application/json" \
  -d '{"query": "{ chain { latestBlock { id height } } }"}' | jq -r '.data.chain.latestBlock.height')

# Define HELP and TYPE
help_comment="# HELP fuel_height Fuel node block height"
type_comment="# TYPE fuel_height gauge"

# Define HELP and TYPE for block id
help_comment_id="# HELP fuel_block_id Fuel node block id"
type_comment_id="# TYPE fuel_block_id gauge"

# Overwrite the metrics file with the new data
{
    echo "$help_comment_height"
    echo "$type_comment_height"
    echo "fuel_height $height"
    echo "$help_comment_id"
    echo "$type_comment_id"
    echo "fuel_block_id $block_id"
} > "$metrics_file"
