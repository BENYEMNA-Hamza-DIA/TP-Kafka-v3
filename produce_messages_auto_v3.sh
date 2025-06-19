#!/bin/bash

# 🔹 Configuration
KAFKA_CONTAINER="kafka1"
BOOTSTRAP_SERVER="kafka-lb:9092"
TOPICS=("topic1" "topic2" "topic3")
DURATION=90  # Durée en secondes (ex: 1 minute)
INTERVAL=3     # Intervalle entre chaque envoi

echo "📤 [INFO] Début de la production automatique de messages..."

START_TIME=$(date +%s)
GLOBAL_COUNT=1

while (( $(date +%s) - START_TIME < DURATION )); do
    for TOPIC in "${TOPICS[@]}"; do
        for N in 1 2; do
            MESSAGE="message-${TOPIC}-n${GLOBAL_COUNT}"
            echo "$MESSAGE" | docker-compose exec -T "$KAFKA_CONTAINER" kafka-console-producer \
                --bootstrap-server "$BOOTSTRAP_SERVER" \
                --topic "$TOPIC"
            echo "✅ [Envoyé] $MESSAGE → $TOPIC"
            ((GLOBAL_COUNT++))
        done
    done

    sleep "$INTERVAL"
done

echo "🛑 [INFO] Fin de la production automatique après $DURATION secondes."
