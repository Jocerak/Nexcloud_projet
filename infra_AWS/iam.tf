resource "aws_iam_role" "s3_access_role" {
  name = "S3AccessRole_v2"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": { "Service": "ec2.amazonaws.com" },
    "Action": "sts:AssumeRole"
  }]
}
EOF
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "S3AccessPolicy"
  description = "Policy for EC2 to access S3"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["s3:GetObject", "s3:PutObject", "s3:ListBucket"],
    "Resource": [
      "${aws_s3_bucket.nextcloud_data.arn}",
      "${aws_s3_bucket.nextcloud_data.arn}/*"
    ]
  }]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3_access_attachment" {
  role       = aws_iam_role.s3_access_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_instance_profile" "s3_access_profile" {
  name = "S3AccessProfile"
  role = aws_iam_role.s3_access_role.name
}
