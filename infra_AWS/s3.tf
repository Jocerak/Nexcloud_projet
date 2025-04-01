resource "aws_s3_bucket" "nextcloud_data" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "NextcloudDataBucket"
    Environment = "dev"
  }
}


