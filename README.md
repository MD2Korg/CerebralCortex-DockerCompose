# CerebralCortex-DockerCompose

## How to run?
### Setup environment
Minimum requirements:
* Any Debian Linux Distro (We have tested it on Centos, Linux Mint, KDE, and Ubuntu)

### Clone and configure CerebralCortex-DataAnalysis
* clone https://github.com/MD2Korg/CerebralCortex-DockerCompose.git
* Execute following commands to run/setup environment:
    * cd CerebralCortex-DockerCompose
    * docker-compose create
    * docker-compose up -d
* Once the system is up and running, you would need to manually run influxdb commands inside the contains.
    * docker-compose exec influxdb influx (command to connect to influxdb container)
    * Please copy and run [influxdb init setup](https://github.com/MD2Korg/CerebralCortex-DockerCompose/blob/master/influxdb/init.txt)
* Note: please modify [docker-compose-yaml](https://github.com/MD2Korg/CerebralCortex-DockerCompose/blob/master/docker-compose.yml) to change ports and other settings.
    
