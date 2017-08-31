FROM jupyter/jupyterhub
MAINTAINER Timothy Hnat twhnat@memphis.edu

# RUN wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz && \
#     tar xvf Python-3.6.0.tgz && \
#     cd Python-3.6.0 && \
#     ./configure --enable-optimizations && \
#     make -j8 && \
#     make altinstall && \
#     cd .. && \
#     rm -rf Python3.6.0*
    


RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get -yqq update && \
    apt-get install -t jessie-backports -yqq openjdk-8-jre && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*


# Spark dependencies
ENV APACHE_SPARK_VERSION 2.2.0
ENV HADOOP_VERSION 2.7


RUN cd /tmp && \
        wget -q http://d3kbcqa49mib13.cloudfront.net/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
        echo "7a186a2a007b2dfd880571f7214a7d329c972510a460a8bdbef9f7f2a891019343c020f74b496a61e5aa42bc9e9a79cc99defe5cb3bf8b6f49c07e01b259bc6b *spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" | sha512sum -c - && \
        tar xzf spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /usr/local && \
        rm spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark

# Mesos dependencies
RUN . /etc/os-release && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    echo "deb http://repos.mesosphere.io/debian jessie main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-get -y update && \
    apt-get --no-install-recommends -y --force-yes install mesos=1.2\* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



ENV SPARK_HOME  /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip
ENV MESOS_NATIVE_LIBRARY /usr/local/lib/libmesos.so
ENV SPARK_OPTS --driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info
ENV JAVA_HOME	/usr/lib/jvm/java-8-openjre-amd64
ENV PYSPARK_PYTHON /opt/conda/bin/python3
ENV PATH        $JAVA_HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH



RUN pip install --upgrade jupyterhub
RUN pip install jupyter

RUN mkdir /opt/conda/share/jupyter/kernels/pyspark
COPY pyspark/kernel.json /opt/conda/share/jupyter/kernels/pyspark/

RUN useradd -m hnat && echo "hnat:hnat" | chpasswd

CMD jupyterhub --no-ssl