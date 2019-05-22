#!/bin/bash
echo "Bienvenue, merci d'indiquez l'adresse ip du Proxy"
read adresseProxy;
echo "adresse du proxy enregistrée: $adresseProxy" 
echo "indiquez le port: "
read portProxy;


echo "Acquire:http::proxy \"http://$adresseProxy:$portProxy/\";" | sudo tee -a /etc/apt/apt.conf.d/70debconf
