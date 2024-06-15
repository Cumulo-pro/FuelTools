
Create a **metrics** directory to store metrics scripts.

```bash
sudo mkdir -p /usr/local/metrics
```

This is a bash script that extracts the desired metrics from the bridge node and sends them to Prometheus. The script is not intrusive it just executes a series of CLI commands and sends the metrics to node_exporter_metrics.prom file, these metrics will be picked up by node_exporter to expose them in Prometheus. 

```bash
sudo wget https://raw.githubusercontent.com/Cumulo-pro/FuelTools/main/fuel_metrics/fuelmetrics.sh -O /usr/local/metrics/fuelmetrics.sh
```

Provides the necessary permissions to the script
```bash
sudo chmod +x /usr/local/metrics/fuelmetrics.sh
```
