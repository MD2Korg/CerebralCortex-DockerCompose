FROM cassandra:3.9

COPY ["entrypoint.sh", "bootstrap.sh", "wait-for-it.sh", "cerebralcortex.cql", "/"]
RUN chmod +x /bootstrap.sh /entrypoint.sh /wait-for-it.sh

ENTRYPOINT ["/bootstrap.sh"]

CMD ["cassandra", "-f"]
