resource "aws_iam_role" "snowflake_aws_integration_role" {
  name = local.aws_iam_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = snowflake_storage_integration.this.storage_aws_iam_user_arn
        }
        Condition = {
          StringEquals = {
            "sts:ExternalId" = snowflake_storage_integration.this.storage_aws_external_id
          }
        }
      }
    ]
  })
}

data "aws_iam_policy_document" "tf-example" {
  statement {
    actions   = ["s3:GetObject", "s3:GetObjectVersion"]
    resources = ["${local.s3_bucket_arn}/*"]
    effect    = "Allow"
  }
  statement {
    actions   = ["s3:GetObject", "s3:GetObjectVersion"]
    resources = [local.s3_bucket_arn]
    effect    = "Allow"
  }
}

resource "aws_iam_role_policy" "tf-snowflake-s3-access" {
  name   = "${local.aws_iam_policy_name}-policy"
  role   = aws_iam_role.snowflake_aws_integration_role.id
  policy = data.aws_iam_policy_document.tf-example.json
}
