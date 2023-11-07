terraform {

  backend "s3" {
    bucket = "web-ducks-server-develop"
    key = "path/to/my/key"
    region = "us-east-1"
    dynamodb_table = "dynamodb-ducks-develop"
    encrypt = true
   }
}