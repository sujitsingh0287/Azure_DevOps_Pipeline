module "new_rg" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}

module "new_SA" {
  source     = "./modules/storage_account"
  depends_on = [module.new_rg]
  dev_stg    = var.dev_stg
  rg_name    = var.rg_name
  location   = var.location
}


module "vnet" {
  source        = "./modules/Virtual_Network"
  depends_on    = [module.new_rg]
  rg_name       = var.rg_name
  location      = var.location
  vnet_name     = var.vnet_name
  address_space = ["10.0.0.0/16"]
  subnet        = var.subnet

}

module "myvm" {
  source     = "./modules/Virtual_Machine"
  depends_on = [module.vnet, module.new_rg]
  rg_name    = var.rg_name
  vm_name    = var.vm_name
  location   = var.location
  subnet_id  = module.vnet.subnet_id

}




