# Getting Started

### How to
* How to start Docker Compose: docker-compose up (with -d will run in the background)
* How to stop Docker Compose: docker-compose down (with --volumes will delete the volumes also)
* How to check logs: docker-compose logs -f (you can add the name of the service for filter the logs)
* How to use kafkacat in this demo:
    * How to open a remote shell: docker-compose exec kafkacat /bin/sh
    * How to list topics: kafkacat -L -b broker:29092
    * How to consume topics: kafkacat -b broker:29092 -r http://schema-registry:8081 -s avro -t topic_name -C -o -10 -q 
* How to open the MYSQL Console: docker exec -it mysql bash -c 'mysql -u root -p$MYSQL_ROOT_PASSWORD demo'
* How to open the Postgres Console: docker exec -it postgres bash -c 'psql -U $POSTGRES_USER $POSTGRES_DB'



### Guides
The following guides illustrate how to use some features concretely:

* [How to create data for demos](https://www.mockaroo.com/)
* [How to keep only the after value in a Debezium event with event flattening SMT](https://debezium.io/documentation/reference/stable/transformations/event-flattening.html)
* [Using Kafka Connect JDBC Sink connector with Debezium](https://debezium.io/documentation/reference/stable/connectors/jdbc.html)
  * [Download] (https://repo1.maven.org/maven2/io/debezium/debezium-connector-jdbc/2.2.0.Final/debezium-connector-jdbc-2.2.0.Final-plugin.tar.gz)
* [Also Using Kafka Connect JDBC sink conector from confluent](https://docs.confluent.io/kafka-connect-jdbc/current/sink-connector/index.html)
  * [download here](https://d1i4a15mxbxib1.cloudfront.net/api/plugins/confluentinc/kafka-connect-jdbc/versions/10.7.1/confluentinc-kafka-connect-jdbc-10.7.1.zip)
* [Kafka connect from zero to hero with JDBC Sink](https://github.com/confluentinc/demo-scene/blob/zero-to-hero-with-kafka-connect/kafka-connect-zero-to-hero/demo_zero-to-hero-with-kafka-connect.adoc)

