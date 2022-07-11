#-- to maintain state
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.12.0"
    }
  }
  backend "azurerm"{
    resource_group_name  = "tsnp-sharedresources"
    storage_account_name = "truckstop"
    container_name       = "tfstatenonprod"
    key                  = "tfstatenonprod"
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {
}

data "azurerm_management_group" "ParentManagementGroup" {
  name         = var.ParentManagementGroup
  display_name = "tsnp-landingzones-corp is a Parent Management Group"
}

resource "azurerm_management_group" "Involtadmz" {
  name                       = var.Involtadmz_Name
  id                         = var.Involtadmz_id
  display_name               = "Involta NonProd DMZ Management Group"
  parent_management_group_id = azurerm_management_group.ParentManagementGroup.id

  subscription_ids           = var.Subscription_dmz
  # other subscription IDs can go here
}

resource "azurerm_management_group" "Involtaprivate" {
  name                       = var.Involtaprivate_Name
  id                         = var.Involtprivate_id
  display_name               = "Involta NonProd Private Management Group"
  parent_management_group_id = azurerm_management_group.ParentManagementGroup.id

  subscription_ids           = var.subscription_private
  # other subscription IDs can go here
}

resource "azurerm_management_group_subscription_association" "Involtadmz_association" {
  management_group_id = azurerm_management_group.Involtadmz.id
  subscription_id     = var.subscription_dmz
}

resource "azurerm_management_group_subscription_association" "Involtaprivate_association" {
  management_group_id = azurerm_management_group.Involtaprivate.id
  subscription_id     = var.subscription_private
}


