#!/bin/bash

#
#   autor: vanilton filho - github.com/vanilton-filho - 2021
#

#
# Inicialmente este script disponibiliza algumas tags
# Se você deseja encontrar outras acesse:
# https://hub.docker.com/_/microsoft-mssql-server
# Lembrando que você pode contribuir e melhorar este script ;)
# 
printf "\xF0\x9F\x90\x8B Pull da imagem Microsoft SQL Server | tags =>\n"
PS3="Informe o número correspondente a tag da imagem que deseja realizar o pull: "
select TAG in 2019-latest 2019-CU10-ubuntu-20.04 2017-latest latest
do
    echo -e "\033[01;32m~>\033[01;37m Ok! Iniciando pull da imagem \033[01;33mmcr.microsoft.com/mssql/server:$TAG\033[01;37m\n"
    case $TAG in 2019-latest)
        docker pull mcr.microsoft.com/mssql/server:2019-latest;;
    2019-CU10-ubuntu-20.04)
        docker pull mcr.microsoft.com/mssql/server:2019-CU10-ubuntu-20.04;;
    2017-latest)
        docker pull mcr.microsoft.com/mssql/server:2017-latest;;
    latest)
        docker pull mcr.microsoft.com/mssql/server:latest;;
    esac
    break;
done

PORT_CONTAINER=$((1024 + $RANDOM % 65535))
CONTAINER_NAME="sql_server_${TAG}_${PORT_CONTAINER}"

echo -e "\xF0\x9F\x90\x8B Criando container... \033[01;33m$TAG\033[01;37m";
echo -e "\033[01;32mUser\033[01;37m: \033[01;33mSA\033[01;37m";
echo -e "\033[01;32mPassword\033[01;37m: \033[01;33mtoor123Docker!\033[01;37m";
echo -e "\033[01;32mPort\033[01;37m: \033[01;33m$PORT_CONTAINER\033[01;37m";
echo -e "\033[01;32mContainer name\033[01;37m: \033[01;33m$CONTAINER_NAME\033[01;37m\n";

echo -e "=> Instruções:\n";
echo -e "Execute o comando: <docker start $CONTAINER_NAME> para executar o serviço";
echo -e "Execute o comando: <docker stop sql_server_$CONTAINER_NAME> para parar o serviço\n";

docker run --name $CONTAINER_NAME -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=toor123Docker!' -p $PORT_CONTAINER:1433 -d mcr.microsoft.com/mssql/server:$TAG
