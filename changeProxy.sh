#!/bin/bash
clear
echo "Bonjour, choisissez votre option"
echo ""
echo "[1] Changement adresse IP"
echo "[2] Changement PROXY"
echo "[3] Changement adresse MAC"
echo ""

read choix;

case $choix in 
1) echo "Sur quelle interface êtes-vous ? (ex : eth0, enp0s3)"

read interface;

echo "vous avez saisi l'interface $interface )"
;;



2)
clear
echo "Vous avez choisi le changement du PROXY"
echo "merci d'indiquez l'adresse ip du Proxy"
read adresseProxy;
echo "adresse du proxy enregistrée: $adresseProxy" 
echo "indiquez le port: "
read portProxy;
echo "Acquire:http::proxy \"http://$adresseProxy:$portProxy/\";" | sudo tee -a /etc/apt/apt.conf.d/70debconf
;;
esac
