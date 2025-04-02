key_pair_name   = "my_key"
public_key_path = "./my_key.pub"
#iam_instance_profile_name = "s3_access_profile"
s3_bucket_name         = "nextcloud-backup-bucket-001"
instance_count         = 4
instance_names         = ["Master", "application", "CI/CD", "monitoring"]
ansible_inventory_path = "~/nextcloud_terra/appli_nextcloud/hosts.yml"
