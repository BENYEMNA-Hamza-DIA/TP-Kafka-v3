#!/bin/bash

sudo apt install -y openjdk-17-jdk

sudo apt install -y docker

sudo usermod -aG docker $USER
newgrp docker

sudo apt install -y docker-compose

sudo systemctl enable docker
sudo systemctl start docker

if sudo ufw status | grep -q "active"; then
    sudo ufw allow 9092/tcp   # HAProxy
    sudo ufw allow 9095/tcp   # Kafka1
    sudo ufw allow 9093/tcp   # Kafka2
    sudo ufw allow 9094/tcp   # Kafka3
    sudo ufw allow 2181/tcp   # Zookeeper
    sudo ufw allow 3000/tcp   # Grafana
    sudo ufw allow 9090/tcp   # Prometheus
    sudo ufw allow 8080/tcp   # Kafka UI
    sudo ufw allow 9308/tcp   # Kafka Exporter
    sudo ufw reload
fi

