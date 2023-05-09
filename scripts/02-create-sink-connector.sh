curl -i -X PUT -H  "Content-Type:application/json" \
    http://localhost:8083/connectors/sink-debezium/config \
    -d '{
    "connector.class": "io.debezium.connector.jdbc.JdbcSinkConnector",
    "topics": "mysql.demo.ORDERS",
    "tasks.max": "1",  
    "connection.url": "jdbc:postgresql://postgres:5432/",  
    "connection.username": "postgres",  
    "connection.password": "postgres",  
    "insert.mode": "upsert",  
    "delete.enabled": "true",  
    "primary.key.mode": "record_key",  
    "schema.evolution": "none",  
    "database.time_zone": "UTC",
    "transforms": "unwrap",
    "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState"  
    }'
