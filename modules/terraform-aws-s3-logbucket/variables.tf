variable "name" {
  type        = string
  default     = "aws-centralized-logging-"
  description = <<EOT
Specify the prefix that will be used for the buckets provisioned in each region. Must be lowercase and
less than or equal to 37 characters in length. A full list of bucket naming rules
may be found [here](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html).

A generic name is used by default.
EOT
}

variable "delete" {
  type        = bool
  default     = true
  description = <<EOT
Toggle a deletion policy on the AWS S3 bucket that prevents removal of the bucket policy,
and deletion of the bucket. This is intended to prevent against accidental programmatic deletion
of the log buckets.
EOT
}