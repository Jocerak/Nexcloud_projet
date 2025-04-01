variable "aws_region" {
  default     = "eu-west-3"
  description = "Région AWS"
}

variable "ami_id" {
  default     = "ami-06e02ae7bdac6b938"
  description = "AMI Ubuntu"
}

variable "instance_type" {
  default     = "t2.micro"
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
  default     = "eu-west-3a"
  description = "Zone de disponibilité AWS"
}

variable "private_ip_base" {
  default     = "192.168.0"
  description = "Base pour les IP privées"
}

variable "instance_names" {
  #default     = "serveur_ubuntu"
  type = list(string)
  description = "Préfixe du nom des instances"
}

variable "s3_bucket_name" {
  description = "Nom du bucket S3"
  type        = string
}
