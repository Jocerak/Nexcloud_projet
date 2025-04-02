variable "aws_region" {
  default     = "eu-north-1"
  description = "Région AWS"
}

variable "ami_id" {
  default     = "ami-0c1ac8a41498c1a9c"
  description = "AMI Ubuntu"
}

variable "instance_type" {
  default     = "t3.micro"
  description = "Type d'instance EC2"
}

variable "instance_count" {
  default     = 1
  description = "Nombre d'instances à déployer"
}

variable "key_pair_name" {
  description = "Nom de la clé SSH à utiliser"
  type        = string
}

variable "public_key_path" {
  description = "Chemin vers la clé publique SSH"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Nom du profil IAM à associer aux instances"
  type        = string
  default     = "S3AccessProfile"
}

variable "vpc_cidr" {
  default     = "192.168.0.0/16"
  description = "CIDR du VPC"
}

variable "subnet_cidr" {
  default     = "192.168.0.0/24"
  description = "CIDR du subnet"
}

variable "availability_zone" {
  default     = "eu-north-1a"
  description = "Zone de disponibilité AWS"
}

variable "private_ip_base" {
  default     = "192.168.0"
  description = "Base pour les IP privées"
}

variable "instance_names" {
  #default     = "serveur_ubuntu"
  type        = list(string)
  description = "Préfixe du nom des instances"
}

variable "s3_bucket_name" {
  description = "Nom du bucket S3"
  type        = string
}

variable "ansible_inventory_path" {
  description = "Chemin du fichier Ansible hosts.yml"
  type        = string
  default     = "~/nextcloud_terra/appli_nextcloud/hosts.yml"
}