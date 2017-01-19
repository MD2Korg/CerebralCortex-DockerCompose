DROP KEYSPACE IF EXISTS cerebralcortex;

CREATE KEYSPACE cerebralcortex WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '3'}  AND durable_writes = true;

CREATE TABLE cerebralcortex.data (
    ds_id uuid,
    day varchar,
    datetime timestamp,
    sample varchar,
    PRIMARY KEY ((ds_id, day), datetime)
) WITH CLUSTERING ORDER BY (datetime ASC);
