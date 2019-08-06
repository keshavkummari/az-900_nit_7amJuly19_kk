#!/bin/bash

# Update for your Admin Password 
AdminPassword=NIT@123456789

# Create a Resource Group
az group create --name myResourceGroup1 --location southindia

# Create a Virtual Network 
az network vnet create --resource-group myResourceGroup1 --name myVent1 --subnet-name mySubnet1

# Create a Public IpAddress
az network public-ip create --resource-group myResourceGroup1 --name myPublicIP1

# Create a Network Security Group
az network nsg create --resource-group myResourceGroup1 --name myNetworkSecurityGroup1

# Create a Vitual Network Card and associate with Public-IP and NSG 
az network nic create --resource-group myResourceGroup1 --name myNIC1 --vnet-name myVent1 --subnet mySubnet1 --network-security-group myNetworkSecurityGroup1 --public-ip-address myPublicIP1

# Create a Virtual Machine 
az vm create --resource-group myResourceGroup1 --name myVM1 --location southindia --nics myNIC1 --image win2019datacenter --admin-username azureuser1 --admin-password $AdminPassword

# Open Port 3389 to Allow RDP Traffic to Host
az vm open-port --port 3389 --resource-group myResourceGroup1 --name myVM1
