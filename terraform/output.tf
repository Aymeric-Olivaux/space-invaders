output "aws-s3-endpoint" {
  value = aws_s3_bucket.b.bucket_domain_name
}