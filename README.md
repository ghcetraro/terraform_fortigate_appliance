# README

This repository is used to install setup fortigate appliance with terraform

## Configuration with aws sso

  - You need to create/configure your parameters in the following file  
```
    terraform.tfvars
```

  - You need to create your profile admin profile in fortigate and a api token to use this repository


## Running

To run the following scripts, you will need to have ADMIN privileges.

  Following 3 commands need to be executed for every deployment
``` 
  terraform init 
  terraform plan 
  terraform apply 
```

## Pre-requisites

- Terraform CLI is [installed](https://learn.hashicorp.com/tutorials/terraform/install-cli).  

## Resources

Resources that are going to be deployed  
```
	Fortigate Appliance Configurations
```

## Dependencies
	
	Fortigate Appliance