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
    key                  = var.statename   #Name of the state
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

resource "azurerm_management_group" "RMISdmz" {
  name                       = var.RMISdmz_Name
  id                         = var.RMISdmz_id
  display_name               = "RMIS NonProd DMZ Management Group"
  parent_management_group_id = azurerm_management_group.ParentManagementGroup.id

  subscription_ids           = var.Subscription_dmz

  # other subscription IDs can go here
}

resource "azurerm_management_group" "RMISprivate" {
  name                       = var.RMISprivate_Name
  id                         = var.RMISdmz_id
  display_name               = "RMIS NonProd Private Management Group"
  parent_management_group_id = azurerm_management_group.ParentManagementGroup.id

  subscription_ids           = var.subscription_private

  # other subscription IDs can go here
}

resource "azurerm_management_group_subscription_association" "RMISdmz_association" {
  management_group_id = azurerm_management_group.RMISdmz.id
  subscription_id     = var.subscription_dmz
}

resource "azurerm_management_group_subscription_association" "RIMSprivate_association" {
  management_group_id = azurerm_management_group.RMISprivate.id
  subscription_id     = var.subscription_private
}