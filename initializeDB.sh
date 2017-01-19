#!/usr/bin/env sh

#Setup Kafka Topics
docker-compose exec kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-topics.sh --zookeeper 127.0.0.1:2181 --create --topic cc-test-topic --if-not-exists --partitions 3 --replication-factor 1
docker-compose exec kafka /opt/kafka_2.11-0.10.1.0/bin/kafka-topics.sh --zookeeper 127.0.0.1:2181 --describe

#Setup Cassandra keyspace and tables
docker cp cerebralcortex.cql `docker-compose ps -q cassandra`:/
docker-compose exec cassandra cqlsh -f /cerebralcortex.cql

#Setup MySQL database and tables
docker cp cerebralcortex_mysql.sql `docker-compose ps -q mysql`:/
docker-compose exec mysql sh -c 'mysql -u $MYSQL_USER -p$MYSQL_PASSWORD < /cerebralcortex_mysql.sql'
