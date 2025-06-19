#!/bin/bash

sudo bash start_kafka.sh

sudo bash create_topics.sh

sudo bash create_consumers.sh

sudo bash produce_messages_auto.sh

sleep 5

sudo docker-compose down

sudo docker prune-f







