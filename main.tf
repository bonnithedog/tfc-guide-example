#provider "aws" {
#  version = "2.33.0"
#
#  region = var.aws_region
#}
#
#provider "random" {
#  version = "2.2"
#}
#
#resource "random_pet" "table_name" {}
#
#resource "aws_dynamodb_table" "tfc_example_table" {
#  name = "${var.db_table_name}-${random_pet.table_name.id}"
#
#  read_capacity  = var.db_read_capacity
#  write_capacity = var.db_write_capacity
#  hash_key       = "UUID"
#
#  attribute {
#    name = "UUID"
#    type = "S"
#  }
#
#  tags = {
#    user_name = var.tag_user_name
#  }
#}
variable "client_secret" {
}

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=2.4.0"

  subscription_id = "5f821010-caae-4a0c-b435-0bc6224fea93"
  client_id       = "313419a7-8b5d-4e6a-8581-3c1621c14497"
  client_secret   = var.client_secret
  tenant_id       = "147ae4e2-d977-491a-9760-680bc8ce94c9"

  features {}
}
