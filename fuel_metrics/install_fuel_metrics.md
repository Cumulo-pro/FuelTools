This is a bash script that extracts the desired metrics from the bridge node and sends them to Prometheus. The script is not intrusive it just executes a series of CLI commands and sends the metrics to node_exporter_metrics.prom file, these metrics will be picked up by node_exporter to expose them in Prometheus. 

```bash
sudo wget https://raw.githubusercontent.com/Cumulo-pro/Celestia-monitoring/main/bridge-monitor/get_bridge_height.sh -O /usr/local/metrics/get_bridge_height.sh
```
