#!/bin/bash

# Update package lists
sudo apt update

# Install net-tools for ifconfig command
sudo apt install -y net-tools

# Stop and disable UFW (Uncomplicated Firewall)
sudo systemctl stop ufw
sudo systemctl disable ufw

# Stop and disable iptables
sudo systemctl stop iptables
sudo systemctl disable iptables

# Install OpenJDK 11
sudo apt install -y openjdk-11-jdk

# Set JAVA_HOME environment variable
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc

wget https://dlcdn.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz
tar -xvzf kafka_2.13-3.7.0.tgz
