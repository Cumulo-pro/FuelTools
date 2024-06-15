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

# save
{
    echo "$help_comment"
    echo "$type_comment"
    echo "fuel_height $height"
} >> "$metrics_file"

