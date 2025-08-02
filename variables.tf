variable "dev_stg" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string

}

variable "vm_name" {
  type = string
}

# variable "subnet_id" {
#   type = string

# }

variable "subnet" {
  type = string

}


variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
  sensitive = true
}

variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}