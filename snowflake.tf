# snowflake storage integration
resource "snowflake_storage_integration" "this" {
  name                      = upper(var.storage_integration_name)
  type                      = "EXTERNAL_STAGE"
  enabled                   = true
  storage_allowed_locations = [var.s3_allowed_locations]
  storage_provider          = "S3"
  storage_aws_role_arn      = local.aws_iam_role_arn
  # aws_iam_role.snowflake_s3_reader.arn -- Needs proper setup to used from the terraform config itself
}

