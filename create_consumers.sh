#!/bin/bash

declare -A CONSUMERS_GROUPS
CONSUMERS_GROUPS["topic1"]=1
CONSUMERS_GROUPS["topic2"]=2
CONSUMERS_GROUPS["topic3"]=3

BOOTSTRAP_SERVER="kafka-lb:9092"
SESSION_TIMEOUT="45000"           # 45 secondes
MAX_POLL_INTERVAL="120000"        # 2 minutes

echo "👥 [INFO] Création des Consumer Groups..."
for topic in "${!CONSUMERS_GROUPS[@]}"; do
    GROUP_NAME="group_$topic"
    NUM_CONSUMERS=${CONSUMERS_GROUPS[$topic]}

    for (( i=1; i<=NUM_CONSUMERS; i++ )); do
        echo "🎧 [INFO] Démarrage du Consumer $i dans $GROUP_NAME..."
        docker-compose exec -T kafka1 kafka-console-consumer \
            --topic "$topic" \
            --group "$GROUP_NAME" \
            --bootstrap-server "$BOOTSTRAP_SERVER" \
            --consumer-property session.timeout.ms=$SESSION_TIMEOUT \
            --consumer-property max.poll.interval.ms=$MAX_POLL_INTERVAL \
            > "consumer_${GROUP_NAME}_${i}.log" 2>&1 &
    done
done
