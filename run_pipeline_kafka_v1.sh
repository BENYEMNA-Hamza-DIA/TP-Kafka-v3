#!/bin/bash

sudo bash start_kafka.sh
sleep 7

sudo bash create_topics.sh
sleep 7

sudo bash create_consumers.sh
sleep 7

sudo bash produce_messages_auto_v1.sh
sleep 10






