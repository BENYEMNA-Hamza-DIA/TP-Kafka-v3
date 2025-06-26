# 🔹 Lancer la production automatique de messages
echo "🚀 [INFO] Lancement de la production automatique de messages..."
sudo bash produce_messages_auto_v2.sh

# 🔹 Récupération des messages consommés
echo "📥 [INFO] Récupération des messages consommés..."
sudo bash consume_messages_auto.sh


# Test de failover
echo "❗⚠️ [INFO] On simule une panne en arretant le noeud actif kafka1"
sudo docker-compose stop kafka1
sleep 5


#echo "✅ Les consumers actifs seront basculés vers un autre noeud disponible"
sleep 5


# 🔹 Lancer la production automatique de messages
echo "🚀 [INFO] Lancement de la production automatique de messages après fail over... (2/2)"
sudo bash produce_messages_auto_v3.sh


echo "Attente de la fin de consommation des messages"
sleep 5


# 🔹 Récupération des messages consommés
echo "📥 [INFO] Récupération des messages consommés..."
sudo bash consume_messages_auto.sh




