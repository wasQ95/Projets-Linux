#!/bin/bash
clear
echo "Bonjour, choisissez votre option"
echo ""
echo "[1] Changement adresse IP"
echo "[2] Changement PROXY"
echo "[3] Changement adresse MAC"
echo "[4] Configuration Automatique Lycée (proxy,ftp,)"

read choix;

case $choix in 

#------------------------------------------------------------------------------------------------------------------------
1) 

sudo nano /etc/network/interfaces
;;
#------------------------------------------------------------------------------------------------------------------------
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
#------------------------------------------------------------------------------------------------------------------------
3)

;;
#------------------------------------------------------------------------------------------------------------------------
4)
clear
echo "Configuration automatique en cours..."

#APT-CACHE
echo "Configuration APT-CACHE..."
echo 'Acquire:http::proxy "http://10.1.0.10:9999/";' | sudo tee -a /etc/apt/apt.conf.d/70debconf

#PROXY HTTP
echo "Configuration PROXY HTTP..."
echo 'http_proxy"http://10.1.2.5:8080/";' | sudo tee -a /etc/environment
echo 'https_proxy"http://10.1.2.5:8080/";' | sudo tee -a /etc/environment
echo 'ftp_proxy"http://10.1.2.5:8080/";' | sudo tee -a /etc/environment


#DELOCK DPKG
echo "Deblocage DPKG..."
sudo lsof /var/lib/dpkg/lock/

# REDEMARRAGE CARTE-RESEAU
sudo service networking restart

;;
esac
#------------------------------------------------------------------------------------------------------------------------
