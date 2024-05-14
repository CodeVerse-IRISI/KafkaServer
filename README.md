This repository contains a Vagrantfile, a provision script (`provision.sh`), and a full provision script (`fullProvision.sh`) to set up a Kafka server with one topic named "sounds" containing three partitions.

## Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads.html) installed
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed

## Setup

1. Clone this repository:
git clone https://github.com/CodeVerse-IRISI/KafkaServer.git
2. cd kafka-vagrant
3. Start the Vagrant machine:
vagrant up
This will automatically run the `provision.sh` script and set up the Kafka server with the desired configuration.

## Usage

After the Vagrant machine is up and running, you can access the Kafka server via SSH:
vagrant ssh
The Kafka server will be running, and the topic "sounds" with three partitions will be created automatically.

### Working with Topics

You can list the available topics using the following command:
/opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --list
This should output the "sounds" topic.

You can also describe the topic to verify the number of partitions:
/opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic sounds
This should show the "sounds" topic with three partitions.

### Working with Producers and Consumers

To start a producer and send messages to the "sounds" topic:
/opt/kafka/bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic sounds
To start a consumer and read messages from the "sounds" topic:
/opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic sounds --from-beginning
### Additional Commands

The `fullProvision.sh` script includes additional commands and configurations for the Kafka server. You can run this script manually after connecting to the Vagrant machine:
vagrant ssh
sudo /path/to/fullProvision.sh
This script may include commands for creating additional topics, configuring Kafka settings, or performing other tasks specific to your setup.

You can refer to the Apache Kafka documentation for more commands and options: https://kafka.apache.org/documentation/

## Listeners

The Kafka server is configured with the following listeners:

- `PLAINTEXT://192.168.137.1:9092`

## Cleanup

To stop and remove the Vagrant machine, run:
vagrant halt
vagrant destroy
This will stop the Vagrant machine and delete all resources associated with it.

## Notes

- The `provision.sh` script installs and configures Apache Kafka on the Vagrant machine.
- The `fullProvision.sh` script includes additional commands and configurations for the Kafka server.
- The Vagrantfile is configured to use the Ubuntu/focal64 box.
- The Kafka server is installed in the `/opt/kafka` directory on the Vagrant machine.

Feel free to modify the `provision.sh`, `fullProvision.sh` scripts, or the Vagrantfile according to your specific requirements.
This updated README.md includes information about the fullProvision.sh script and instructions on how to run it manually after connecting to the Vagrant machine. It also mentions that this script may include additional commands and configurations specific to your Kafka server setup.
