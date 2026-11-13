# Intentionally insecure sample. Do not apply.
resource "aws_s3_bucket" "demo" {
  bucket = "sdlc-poc-demo-public-bucket"
}

resource "aws_s3_bucket_public_access_block" "demo" {
  bucket                  = aws_s3_bucket.demo.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_security_group" "demo" {
  name = "sdlc-poc-open-ingress"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
