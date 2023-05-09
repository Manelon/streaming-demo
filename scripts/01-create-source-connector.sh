curl -i -X PUT -H  "Content-Type:application/json" \
    http://localhost:8083/connectors/source-debezium-orders/config \
    -d '{
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "database.hostname": "mysql",
    "database.port": "3306",
    "database.user": "debezium",
    "database.password": "dbz",
    "database.server.id": "42",
    "topic.prefix": "mysql",
    "schema.history.internal.kafka.bootstrap.servers": "broker:29092",
    "schema.history.internal.kafka.topic": "schemahistory.demo",
    "time.precision.mode": "adaptive_time_microseconds",
    "include.schema.changes": "true"
    }'
