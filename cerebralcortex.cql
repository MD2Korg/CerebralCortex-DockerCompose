DROP KEYSPACE IF EXISTS cerebralcortex;

CREATE KEYSPACE cerebralcortex WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE cerebralcortex.datapoint (
    datastream_id varint,
    day text,
    datetime timestamp,
    sample text,
    PRIMARY KEY ((datastream_id, day), datetime)
) WITH CLUSTERING ORDER BY (datetime ASC);

CREATE TABLE cerebralcortex.span (
    span_id varint,
    day text,
    start_time timestamp,
    end_time timestamp,
    label text,
    PRIMARY KEY ((span_id, day), start_time)
) WITH CLUSTERING ORDER BY (start_time ASC);

