
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


Create a service file and timer to run the script periodically **/etc/systemd/system/ful_metrics.service**:

```bash
sudo tee /etc/systemd/system/fuel_metrics.service > /dev/null << EOF
[Unit]
Description=Bridge metrics update
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/local/metrics/fuelmetrics.sh

[Install]
WantedBy=multi-user.target
EOF
```


Enable and start services:

```bash
sudo systemctl daemon-reload
sudo systemctl enable fuel_metrics.service
sudo systemctl start fuel_metrics.service
```

Create the timer **/etc/systemd/system/fuel_metrics.timer**:

```bash
sudo tee /etc/systemd/system/fuel_metrics.timer > /dev/null << EOF
[Unit]
Description=Temporizador para la actualización de métricas del puente

[Timer]
OnUnitActiveSec=6s
Persistent=true

[Install]
WantedBy=timers.target
EOF
```

Enable and start services:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now fuel_metrics.timer
```

## Step 4: Verification

Check that the Node Exporter, update_bridge_metrics and the timer are working correctly:

```bash
sudo systemctl status node_exporter
sudo systemctl status fuel_metrics.service
sudo systemctl status fuel_metrics.timer
```
