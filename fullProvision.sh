cd kafka_2.13-3.7.0/

#Generate a Cluster UUID
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"

#Format Log Directories
bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties

# you should first replace localhost with your host ip in the advertised.listeners=PLAINTEXT://<HOST IP>:9092
vim config/kraft/server.properties

#Start the Kafka Server
sudo bin/kafka-server-start.sh config/kraft/server.properties

#create the sounds topic in other bash cli
cd kafka_2.13-3.7.0/
bin/kafka-topics.sh --create --partitions 3 --replication-factor 1 --topic sounds --bootstrap-server localhost:9092

# describe
bin/kafka-topics.sh --describe --topic sounds --bootstrap-server localhost:9092


# consuming
bin/kafka-console-consumer.sh --topic sounds --bootstrap-server localhost:9092