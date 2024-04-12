output "snowflake_aws_iam_user" {
  description = "Snowflake role from which will access AWS"
  value       = snowflake_storage_integration.this.storage_aws_iam_user_arn
}

output "snowflake_aws_external_id" {
  description = "External ID to update trust policy in AWS"
  value       = snowflake_storage_integration.this.storage_aws_external_id
}

output "aws_iam_role_arn" {
  description = "AWS Role"
  value       = aws_iam_role.snowflake_aws_integration_role.arn
}