#!/bin/bash
clear
echo "[1] Création de clé privée"
echo "[2] Création de clé publique"
echo "[3] Afficher vos clés locales"
echo "[4] Encrypter un message avec clé publique"
echo "[5] Décrypter un message"

read choix;

case $choix in
#---------------------------------------------------------------------------------------
1)
clear
gpg2 --full-generate-key
 
;;
#---------------------------------------------------------------------------------------
2)
clear
echo "Afin de créer une clé publique, nous avons besoin de votre clé privé."
echo "Merci de saisir votre clé privé : "
read privateKey;
gpg2 -armor --export $privateKey >> publicKey.key
clear
echo "Votre clé publique viens d'être sauvegardé sous le nom de 'publicKey.key'"
;;
#---------------------------------------------------------------------------------------
3)
clear
gpg2 --list-key
 
;;
#---------------------------------------------------------------------------------------
4)
clear
echo "Veuillez saisir le chemin de la clé publique du destinataire :"
read chemin;
gpg2 --import $chemin
echo "La clé publique du destinataire viens d'être sauvegardée."
echo "Veuillez saisir l'email du destinataire :"
read emailDest;
echo "Veuillez saisir le chemin du fichier à crypter:"
read cheminFileEncrypt;
gpg2 --encrypt --armor -r $emailDest $cheminFileEncrypt
;;
#---------------------------------------------------------------------------------------
5)
clear
echo "Veuillez saisir le chemin du fichier à décrypter"
read cheminFileDecrypt;
gpg2 $cheminFileDecrypt
;;
esac
#---------------------------------------------------------------------------------------
