terraform {
    backend "s3" {
        bucket = "s3_bucket_name"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "db_table_name"
        encrypt = true
    }
}