#!/bin/bash

sudo bash start_kafka.sh
sleep 5

sudo bash create_topics.sh

sudo bash create_consumers.sh
sleep 5

sudo bash produce_messages_auto_v1.sh
sleep 5






