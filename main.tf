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
#variable "client_secret" {
#}


variable "subscription_id" {} 
variable "client_id" {} 
variable "client_secret" {} 
variable "tenant_id" {} 

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=2.4.0"
  


  subscription_id = var.azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret 
  tenant_id       = var.azure-tenant-id

  features {}
}
