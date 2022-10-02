# data "aws_dynamodb_table" "tableName" {
#   name = "chrisdyna"
# }

resource "aws_dynamodb_table" "store" {
  name             = "chrisdyna"
  hash_key         = "lockid"
  billing_mode     = "PROVISIONED"
#   stream_enabled   = true
#   stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "lockid"
    type = "S"
  }

  server_side_encryption {
   enabled = true 
   // false -> use AWS Owned CMK 
   // true -> use AWS Managed CMK 
   // true + key arn -> use custom key
  }


}