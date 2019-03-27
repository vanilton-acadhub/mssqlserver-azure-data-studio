#!/bin/bash

#
#   autor: Vanilton Alves dos Santos Filho - github.com/vanilton-acadhub - 2019
#

#
# Inicialmente este script disponibiliza 3 tags
# Se você deseja encontrar outras acesse:
# https://hub.docker.com/_/microsoft-mssql-server
# Lembrando que você pode contribuir e melhorar este script ;)
# 
printf "\xF0\x9F\x90\x8B Pull da imagem Microsoft SQL Server | tags =>\n"
PS3="Informe o número correspondente a tag da imagem que deseja realizar o pull: "
select TAG in 2017-latest latest-ubuntu 2017-latest-ubuntu

do
    echo -e "\033[01;32m~>\033[01;37m Ok! Iniciando pull da imagem \033[01;33mmcr.microsoft.com/mssql/server:$TAG\033[01;37m\n"
    case $TAG in 2017-latest)
        sudo docker pull mcr.microsoft.com/mssql/server:2017-latest;;
    latest-ubuntu)
        sudo docker pull mcr.microsoft.com/mssql/server:latest-ubuntu;;
    2017-latest-ubuntu)
        sudo docker pull mcr.microsoft.com/mssql/server:2017-latest-ubuntu;;
    esac
    break;
done
