#!/bin/bash

# Chemin vers ta clé privée (doit correspondre à celle utilisée dans Terraform)
KEY_PATH="~/.ssh/id_rsa"  # modifie si ta clé privée est ailleurs

# Récupération des IPs publiques depuis Terraform (format JSON)
echo "🔎 Récupération des adresses IP publiques via Terraform..."
PUBLIC_IPS=$(terraform output -json instance_public_ips | jq -r '.[]')

# Vérifie si jq est installé
if ! command -v jq &> /dev/null; then
    echo "❌ 'jq' est requis mais non installé. Installe-le avec : sudo apt install jq"
    exit 1
fi

# Affiche les IPs trouvées
echo "🖥️ Instances trouvées :"
echo "$PUBLIC_IPS"

# Boucle sur chaque IP
i=1
for ip in $PUBLIC_IPS; do
    echo "🔐 Connexion SSH à l'instance $i ($ip)..."
    ssh -o StrictHostKeyChecking=no -i $KEY_PATH ubuntu@$ip
    i=$((i + 1))
done
