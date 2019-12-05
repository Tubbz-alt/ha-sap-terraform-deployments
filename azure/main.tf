module "drbd_node" {
  source                 = "./modules/drbd_node"
  az_region              = var.az_region
  drbd_count             = var.drbd_enabled == true ? 2 : 0
  instancetype           = "Standard_B1ms"
  drbd_image_uri         = var.drbd_image_uri
  drbd_public_publisher  = var.drbd_public_publisher
  drbd_public_offer      = var.drbd_public_offer
  drbd_public_sku        = var.drbd_public_sku
  drbd_public_version    = var.drbd_public_version
  resource_group_name    = azurerm_resource_group.myrg.name
  network_subnet_id      = azurerm_subnet.mysubnet.id
  sec_group_id           = azurerm_network_security_group.mysecgroup.id
  storage_account        = azurerm_storage_account.mytfstorageacc.primary_blob_endpoint
  public_key_location    = var.public_key_location
  private_key_location   = var.private_key_location
  cluster_ssh_pub        = var.cluster_ssh_pub
  cluster_ssh_key        = var.cluster_ssh_key
  admin_user             = var.admin_user
  host_ips               = var.drbd_ips
  iscsi_srv_ip           = azurerm_network_interface.iscsisrv.private_ip_address
  reg_code               = var.reg_code
  reg_email              = var.reg_email
  reg_additional_modules = var.reg_additional_modules
  ha_sap_deployment_repo = var.ha_sap_deployment_repo
  devel_mode             = var.devel_mode
  provisioner            = var.provisioner
  background             = var.background
  monitoring_enabled     = var.monitoring_enabled
}

module "netweaver_node" {
  source                     = "./modules/netweaver_node"
  az_region                  = var.az_region
  netweaver_count            = var.netweaver_enabled == true ? 4 : 0
  netweaver_image_uri        = var.netweaver_image_uri
  netweaver_public_publisher = var.netweaver_public_publisher
  netweaver_public_offer     = var.netweaver_public_offer
  netweaver_public_sku       = var.netweaver_public_sku
  netweaver_public_version   = var.netweaver_public_version
  resource_group_name        = azurerm_resource_group.myrg.name
  network_subnet_id          = azurerm_subnet.mysubnet.id
  sec_group_id               = azurerm_network_security_group.mysecgroup.id
  storage_account            = azurerm_storage_account.mytfstorageacc.primary_blob_endpoint
  public_key_location        = var.public_key_location
  private_key_location       = var.private_key_location
  cluster_ssh_pub            = var.cluster_ssh_pub
  cluster_ssh_key            = var.cluster_ssh_key
  admin_user                 = var.admin_user
  netweaver_nfs_share        = "10.74.1.201:/HA1" # drbd cluster ip address is hardcoded by now
  storage_account_name       = var.netweaver_storage_account_name
  storage_account_key        = var.netweaver_storage_account_key
  storage_account_path       = var.netweaver_storage_account
  host_ips                   = var.netweaver_ips
  virtual_host_ips           = var.netweaver_virtual_ips
  iscsi_srv_ip               = azurerm_network_interface.iscsisrv.private_ip_address
  reg_code                   = var.reg_code
  reg_email                  = var.reg_email
  reg_additional_modules     = var.reg_additional_modules
  ha_sap_deployment_repo     = var.ha_sap_deployment_repo
  devel_mode                 = var.devel_mode
  provisioner                = var.provisioner
  background                 = var.background
  monitoring_enabled         = var.monitoring_enabled
}
