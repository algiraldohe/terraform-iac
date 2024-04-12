# Required Variables
locals {
  s3_bucket_arn       = "arn:aws:s3:::vindow-data-replication-test2-dev-mongodb2"
  aws_iam_role        = "tf-test-vindow-data-replication-dev-snowflake"
  aws_iam_role_arn    = "arn:aws:iam::157367673944:role/tf-test-vindow-data-replication-dev-snowflake"
  aws_iam_policy_name = "tf-test-s3-reader-policy"
}



variable "storage_integration_name" {
  type        = string
  description = "This is the name describing the storage integration object"
  default     = "tf_vindow_data_replication_test"
}

variable "s3_allowed_locations" {
  type        = string
  description = "S3 URI referencing the allowed locations for the SI"
  default     = "s3://vindow-data-replication-test-dev-mongodb/core-cities/"
}

variable "aws_iam_role" {
  type        = string
  description = "Role that snowflake will assume to access AWS resources"
  default     = "arn:aws:iam::157367673944:role/data-replication-poc-s3-snowflake-integration"
}