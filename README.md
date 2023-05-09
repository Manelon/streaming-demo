# Streaming Demo
## Introduction
This repository contains a demo of streaming data from a MySQL database to a PostgreSQL database using change data capture (CDC) Apache Kafka and Kafka Connect.

## Why CDC and Streaming?
CDC is a very useful technique to replicate the data. Databases uses the CDC stored in a log to replicate the data between the master and the replicas, for instance Amazon with AuroraDB uses the CDC to replicate the data between the master and the replicas.
But you can use the CDC to publish the changes of the database in a Kafka topic. Once you have the data you can use a the whole kafka echo system to do a lot of things with the data.

Some of use case scenarios can be:

- **Cost reduction**: Some database engines charge for the number of queries or usage of the cpu, so you can use a replica to reduce the cost of the queries.

- **Data analysis**: You can use the replica to do some analysis of the data without affecting the production database.

- **Events based on database event**: You can use the CDC data to trigger events, for example, you can send an email when a new user is created in the database or take some action when an user change the name or is deleted. This is great for legacy applications, but in modern applications you can use this approach so you don't need to build a distributed transaction system between the event layer and the database.

- **Materialized Views**: With Kafka you can join data from different topics very fast, so you can build a ETL pipeline with Kafka and Kafka Streams to build a table that stores the result of a join between severa*l tables in real time.

- **Statistics in real time**: With Kafka streams you can build a pipeline that calculates statistics in real time, for example, you can calculate the average of the sales of a product in the last 5 minutes.

## Components

- **Apache Kafka**: This is the core of the demo, we will use [Kafka](https://kafka.apache.org/documentation/) to store the data and to stream the data from the source to the sink. 

- **MySQL**: This is the source of the data, we will use [MySQL](https://www.mysql.com/) to store the data

- **PostgreSQL**: This is the sink of the data, we will use [PostgreSQL](https://www.postgresql.org/) to store the data.

- **Debezium**: This is the tool that we will use to capture the changes in the database, [Debezium](https://debezium.io/) is a CDC tool that can capture the changes in the database and send the changes to Kafka.

- **Kafka Connect**: This is the tool that we will use to stream the data from the source to the sink, [Kafka Connect](https://docs.confluent.io/platform/current/connect/index.html) is a tool that can stream data from different sources to different sinks.
  - **JDBC Sink Connector**: This is the connector that we will use to stream the data from Kafka to PostgreSQL, [Kafka Connect JDBC Sink Connector](https://docs.confluent.io/kafka-connect-jdbc/current/sink-connector/index.html) is a connector that can stream data from Kafka to a JDBC compatible database.
  - **Debezium MySql Source Connector**: This is the connector that we will use to stream the data from MySQL to Kafka, [Debezium MySql Source Connector](https://debezium.io/documentation/reference/1.6/connectors/mysql.html) is a connector that can stream data from MySQL to Kafka.




