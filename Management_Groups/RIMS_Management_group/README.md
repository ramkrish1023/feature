---
layout: page
permalink: /Azure/Terraform/LZ/ManagementGroups/
title: Basic Azure Management Groups
icon: BasicLandingzone.png
description: Setup Management Groups
status: under construction
type: 
automation: TerraformRoot
onlineTemplateReference: 
onlineServiceDescription: 
packageId: 
buildName: 
name: Terraform Azure RIMS Management Group
title: Terraform Azure RIMS Management Group
tags:
- Azure Management Groups
---

{%- include template_terraform.html -%}

How this Management groups get executed :

1. Connect to truckstop VPN
2. Login from VS code to Azure portal
3. Once the connection is establish your able to login to azure portal from VS code
4. Then Next we use the terraform commmands like, terraform init, terraform validate, terraform plan & terraform apply to create resource in portal.
5. First we need to execute the script in Non-prod.
