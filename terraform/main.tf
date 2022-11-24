resource "aws_s3_bucket" "b" {
    bucket = "my-gen-archi-bucket"

    tags = {
        "Environment" = "Dev"
        "Terraform" = "True"
    }
}

resource "aws_s3_bucket_website_configuration" "wb" {
    bucket = aws_s3_bucket.b.id

    index_document {
      suffix = "index.html"
    }
}

resource "aws_s3_bucket_acl" "b_acl" {
  bucket = aws_s3_bucket.b.id
  acl    = "public-read"
}

data "aws_route53_zone" "hosted_zone" {
  name         = "aws.aymericolivaux.fr"
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "archi.${data.aws_route53_zone.hosted_zone.name}"
  zone_id      = data.aws_route53_zone.hosted_zone.id


  wait_for_validation = true

  tags = {
    Name = "archi.${data.aws_route53_zone.hosted_zone.name}"
    "Terraform" = "True"
  }
}

