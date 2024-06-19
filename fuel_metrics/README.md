## Introduction 

This document provides a comprehensive guide on implementing a custom metrics monitoring system for a Fuel node using Prometheus and Node Exporter. Node Exporter is a vital tool that allows for the collection of operating system and server hardware metrics and can be configured to expose metrics specific to the Fuel node. Throughout this guide, you will learn how to set up Node Exporter to capture and expose these metrics and automate the process using scripts and systemd services. This system will give you detailed insights into the performance and status of the Fuel node, facilitating more efficient monitoring and maintenance of the system.

## Available Resources

[![Fuel Metrics Monitoring](https://img.shields.io/badge/-Fuel%20Metrics%20Monitoring-808000?style=for-the-badge&logo=github)](https://github.com/Cumulo-pro/FuelTools/blob/main/fuel_metrics/install_fuel_metrics.md)

Implementation and Configuration of Custom Metrics Monitoring

[![fuelmetrics.sh](https://img.shields.io/badge/-fuelmetrics.sh-808000?style=for-the-badge&logo=github)](https://github.com/Cumulo-pro/FuelTools/blob/main/fuel_metrics/fuelmetrics.sh)

Bash script designed to collect various metrics related to the fuel service and save this data in a metrics file in Prometheus format.

[![Grafana Dashboard JSON Configuration File](https://img.shields.io/badge/-Grafana%20Dashboard%20JSON%20Configuration%20File-808000?style=for-the-badge&logo=github)](https://github.com/Cumulo-pro/FuelTools/blob/main/fuel_metrics/Fuel%20metrics-1718733581399.json)

This resource provides a JSON configuration file for a Grafana dashboard. The file includes all the necessary definitions and settings to visualize Fuel node metrics in Grafana, making it easy to create informative panels and interactive graphs for real-time monitoring.
