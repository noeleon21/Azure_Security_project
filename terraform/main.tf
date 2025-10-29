terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.1.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
     required_version = ">= 1.5.0"
  }
    backend "azurerm" {
        resource_group_name  = "rg-terraform-state-28283"
        storage_account_name = "tfstate6363"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
      }
}


provider "azurerm" {
  features {}
}