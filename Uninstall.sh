#!/bin/bash

#Uninstall¶

#    Stop All Kasm services.

sudo /opt/kasm/current/bin/stop

#    Remove any Kasm session containers.

sudo docker rm -f $(sudo docker container ls -qa --filter="label=kasm.kasmid")

#     Remove Kasm service containers.

export KASM_UID=$(id kasm -u)
export KASM_GID=$(id kasm -g)
sudo -E docker-compose -f /opt/kasm/current/docker/docker-compose.yaml rm

#    Remove the Kasm docker network.

sudo docker network rm kasm_default_network

#    Remove the Kasm database docker volume.

sudo docker volume rm kasm_db_1.10.0

#    Remove the Kasm docker images.

sudo docker rmi redis:5-alpine
sudo docker rmi postgres:9.5-alpine
sudo docker rmi kasmweb/nginx:latest
sudo docker rmi kasmweb/share:1.10.0
sudo docker rmi kasmweb/agent:1.10.0
sudo docker rmi kasmweb/manager:1.10.0
sudo docker rmi kasmweb/api:1.10.0

sudo docker rmi $(sudo docker images --filter "label=com.kasmweb.image=true" -q)

#    Remove the Kasm installation directory structure.

sudo rm -rf /opt/kasm/


