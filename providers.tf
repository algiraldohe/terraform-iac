provider "snowflake" {
  role = "ACCOUNTADMIN"
}

provider "aws" {
  shared_config_files      = ["/Users/alejandrogiraldoh/.aws/config"]
  shared_credentials_files = ["/Users/alejandrogiraldoh/.aws/credentials"]
  profile                  = "dev"
}