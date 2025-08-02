variable "rg_name" {
    type = string
  
}

variable "location" {
    type = string
  
}

variable "vm_name" {
    type = string
    default = "delhi-vm111"
  
}

variable "subnet_id" {
  type = string
  default = "delhi-subnet111"
}

