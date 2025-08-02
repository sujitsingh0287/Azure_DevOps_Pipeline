variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
  default = "old-delhi-vnet"
}

variable "address_space" {
  type = list(string)
}

variable "subnet" {
  type = string
  default = "old-delhi-subnet"
}