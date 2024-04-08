
resource "snowflake_schema" "schema" {
  database = "VINDOW_POC"
  name     = "TF_DEMO"
  comment  = "Schema coming from terraform"

  is_transient        = false
  is_managed          = false
}

# snowflake storage integration
resource "snowflake_storage_integration" "this" {
  name    = upper(var.storage_integration_name)
  type    = "EXTERNAL_STAGE"
  enabled = true
  storage_allowed_locations = [var.s3_allowed_locations]
  storage_provider     = "S3"
  storage_aws_role_arn = var.aws_iam_role
  # aws_iam_role.snowflake_s3_reader.arn -- Needs proper setup to used from the terraform config itself
}

