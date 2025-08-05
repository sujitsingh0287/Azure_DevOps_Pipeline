module "new_rg" {
  source   = "./modules/resource_group"
  rg_name  = "KGF-rg"
  location = "East US"
}

module "new_SA" {
  source     = "./modules/storage_account"
  depends_on = [module.new_rg]
  dev_stg    = "hanumansa1"
  rg_name    = "KGF-rg"
  location   = "East US"
}


module "vnet" {
  source        = "./modules/Virtual_Network"
  depends_on    = [module.new_rg]
  rg_name       = "KGF-rg"
  location      = "East US"
  vnet_name     = "hanuman_vnet"
  address_space = ["10.0.0.0/16"]
  subnet        = "hanuman_subnet"

}



module "myvm" {
  source     = "./modules/Virtual_Machine"
  depends_on = [module.vnet, module.new_rg]
  rg_name    = "KGF-rg"
  vm_name    = "hanuman-vm"
  location   = "East US"
  subnet_id  = module.vnet.subnet_id

}




