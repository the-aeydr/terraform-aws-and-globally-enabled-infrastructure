resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.default.id
  policy = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  dynamic "statement" {
    for_each = var.delete ? ["allow_delete"] : []
    content {
      sid       = "DenyDeleteBucket"
      effect    = "Deny"
      actions   = ["s3:DeleteBucket"]
      resources = [aws_s3_bucket.default.arn]
      principals {
        type        = "AWS"
        identifiers = ["*"]
      }
    }
  }

  dynamic "statement" {
    for_each = var.delete ? ["allow_delete_policy"] : []
    content {
      sid       = "DenyDeleteBucketPolicy"
      effect    = "Deny"
      actions   = ["s3:DeleteBucketPolicy"]
      resources = [aws_s3_bucket.default.arn]
      principals {
        type        = "AWS"
        identifiers = ["*"]
      }
    }
  }

  statement {
    sid       = "ForceSSLOnlyAccess"
    effect    = "Deny"
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.default.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }

  statement {
    sid       = "DenyPublicListGrant"
    effect    = "Deny"
    actions   = ["s3:PutBucketAcl"]
    resources = [aws_s3_bucket.default.arn]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringLike"
      variable = "s3:x-amz-grant-read"
      values = [
        "*http://acs.amazonaws.com/groups/global/AllUsers*",
        "*http://acs.amazonaws.com/groups/global/AuthenticatedUsers*"
      ]
    }
  }

  statement {
    sid    = "DenyPublicReadGrant"
    effect = "Deny"
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = ["${aws_s3_bucket.default.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringLike"
      variable = "s3:x-amz-grant-read"
      values = [
        "*http://acs.amazonaws.com/groups/global/AllUsers*",
        "*http://acs.amazonaws.com/groups/global/AuthenticatedUsers*"
      ]
    }
  }

  statement {
    sid       = "DenyPublicListACL"
    effect    = "Deny"
    actions   = ["s3:PutBucketAcl"]
    resources = [aws_s3_bucket.default.arn]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values = [
        "public-read",
        "public-read-write",
        "authenticated-read"
      ]
    }
  }

  statement {
    sid    = "DenyPublicReadACL"
    effect = "Deny"
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = ["${aws_s3_bucket.default.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values = [
        "public-read",
        "public-read-write",
        "authenticated-read"
      ]
    }
  }
}