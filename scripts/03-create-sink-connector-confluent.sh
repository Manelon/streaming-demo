curl -i -X PUT -H  "Content-Type:application/json" \
    http://localhost:8083/connectors/sink-confluent-orders/config \
    -d '{
    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
    "topics": "mysql.demo.ORDERS",
    "table.name.format": "ORDERS",
    "tasks.max": "1",  
    "connection.url": "jdbc:postgresql://postgres:5432/",  
    "connection.user": "postgres",  
    "connection.password": "postgres", 
    "auto.create": "true",
    "auto.evolve":"true", 
    "insert.mode": "upsert",  
    "delete.enabled": "true",  
    "pk.mode": "record_key",
    "transforms": "unwrap,create_ts,update_ts",
    "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
    "transforms.create_ts.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
    "transforms.create_ts.target.type": "Timestamp",
    "transforms.create_ts.field": "CREATE_TS",
    "transforms.update_ts.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
    "transforms.update_ts.target.type": "Timestamp",
    "transforms.update_ts.field": "UPDATE_TS"   
    }'
