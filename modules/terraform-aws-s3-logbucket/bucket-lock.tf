resource "aws_s3_bucket_object_lock_configuration" "default" {
  bucket = aws_s3_bucket.default.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}
