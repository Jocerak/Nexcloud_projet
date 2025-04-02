#!/bin/bash

# Ce script installe Ansible sur Ubuntu

# Afficher les commandes au fur et à mesure
set -e

echo "🔧 Mise à jour des paquets..."
sudo apt update -y

echo "📦 Installation des dépendances..."
sudo apt install -y software-properties-common python3 python3-pip

echo "➕ Ajout du dépôt officiel Ansible..."
sudo add-apt-repository --yes --update ppa:ansible/ansible

echo "⚙️ Installation d'Ansible..."
sudo apt install -y ansible

echo "✅ Vérification de l'installation :"
ansible --version

echo "🚀 Ansible est maintenant installé sur cette machine."
