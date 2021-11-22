#output "abc" {
#  value = "Hello World \nThis is Terraform"
#}
variable "xyz" {
  default = "10"
}
variable "abc" {}

output "xyz" {
  value = var.xyz
}

output "abc" {
  value = var.abc
}