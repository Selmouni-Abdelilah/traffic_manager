module "west_webapp" {
  source                = "./modules/App_Services"
  rg_name               = "west_rg"
  location              = "West Europe"
  app_service_plan_name = "WestServicePlan"
  app_service_name      = "WestWebApp"
  repo_url              = "https://github.com/Selmouni-Abdelilah/WebApplication_West.git"
  branch                = "master"
}

module "east_webapp" {
  source                = "./modules/App_Services"
  rg_name               = "east_rg"
  location              = "East US"
  app_service_plan_name = "EastServicePlan"
  app_service_name      = "EastWebApp"
  repo_url              = "https://github.com/Selmouni-Abdelilah/WebApplication_East.git"
  branch                = "master"
}
module "west_network" {
  source            = "./modules/Network"
  rg_name              = "west_rg"
  location          = "West Europe"
  vnet_name         = "vnet-westus"
  public_ip_name    = "ip-westus"
  domain_name       = "ipwestus"
}

module "east_network" {
  source            = "./modules/Network"
  rg_name              = "east_rg"
  location          = "East US"
  vnet_name         = "vnet-eastus"
  public_ip_name    = "ip-eastus"
  domain_name       = "ipeastus"
}
module "west_app_gateway" {
  source               = "./modules/app_gateway"
  name                 = "app-gateway-westus"
  rg_name              = "west_rg"
  location             = "West Europe"
  vnet_subnet_id       = module.west_network.subnet_id
  public_ip_id         = module.west_network.public_ip_id
  app_service_fqdn     = module.west_webapp.webapp_name
}

module "east_app_gateway" {
  source               = "./modules/app_gateway"
  name                 = "app-gateway-eastus"
  rg_name              = "east_rg"
  location             = "East US"
  vnet_subnet_id       = module.east_network.subnet_id
  public_ip_id         = module.east_network.public_ip_id
  app_service_fqdn     = module.east_webapp.webapp_name
}
module "traffic_manager" {
  source                    = "./modules/traffic_manager"
  name                      = "traffic-profile1937"
  location                  = "Central US"
  rg_name       = "traffic_manager_rg"
  profile_name              = "traffic-profile2000"
  ttl                       = 100
  monitor_protocol          = "HTTPS"
  monitor_port              = 443
  monitor_path              = "/"
  monitor_interval          = 30
  monitor_timeout           = 10
  monitor_failures          = 2
  primary_target_resource_id = module.east_network.public_ip_id
  secondary_target_resource_id = module.west_network.public_ip_id
}