#!/bin/bash

while getopts s:a:t: flag
do
    case "${flag}" in
        s) SA_PASSWORD=${OPTARG};;
        a) APP_USER_PASSWORD=${OPTARG};;
        t) IMAGE_TAG=${OPTARG};;
    esac
done

echo $IMAGE_TAG

echo "Building Image"

docker build -t wimc.dbtemp:latest .

echo "Running Image"

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$SA_PASSWORD" -p 50001:1433 --name wimc.temp -d wimc.dbtemp:latest

echo "Initializing Database"

sleep 10

docker exec wimc.temp sh -c "/opt/scripts/initialize.sh '$SA_PASSWORD' '$APP_USER_PASSWORD'"

echo "Generating Final Image"

docker commit wimc.temp setrans.azurecr.io/wimc.database:${IMAGE_TAG}

echo "Tear down intermediate containers"

docker stop wimc.temp

docker rm wimc.temp

