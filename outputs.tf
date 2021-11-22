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

variable "samplex" {
  default = [
    "Hello",
    1000,
    true,
    "World"
  ]
}

variable "sampley" {
  default = {
    dfg  = "Hello",
    no  = 100,
    boo = true
  }
}

output "samplex" {
  value = "value 1 = ${var.samplex[0]}, value 2 = ${var.samplex[1]}, value 3 = ${var.samplex[2]}, value 4 = ${var.samplex[3]}"
}

output "sampley" {
  value = "value 1 = ${var.sampley["dfg"]}, value 2 = ${var.sampley["no"]}, value 3 = ${var.sampley["boo"]}"
}

variable "a" {}
output "a" {
  value = var.a
}