# Terraform Azure Infrastructure Setup

This repository contains comprehensive Terraform configuration files to deploy a complete Azure infrastructure with automated CI/CD pipelines. It includes resource groups, virtual networks, subnets, network security groups, public IPs, Linux virtual machines, storage accounts, key vaults, and a modern web dashboard.

## 🎯 Features

- ✅ **Infrastructure as Code**: Fully automated Azure resource provisioning with Terraform
- ✅ **Modular Design**: Reusable Terraform modules for different resource types
- ✅ **Network Security**: Network Security Groups (NSG) with SSH and HTTP rules
- ✅ **CI/CD Pipeline**: GitHub Actions workflow for automated deployment
- ✅ **Web Dashboard**: Interactive UI showing Azure resources and pipeline status
- ✅ **State Management**: Remote backend state storage in Azure
- ✅ **Security Best Practices**: Key Vault integration and secure credential handling
- ✅ **Multi-Environment Support**: Environment-specific configuration files
- ✅ **NGINX Deployment**: Pre-configured web server with custom applications
- ✅ **Automated Deployments**: Terraform-driven infrastructure with GitHub Actions

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.9.8 or later
- An Azure account with active subscription and sufficient permissions
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated
- GitHub account with repository access (for CI/CD workflows)
- Service principal credentials or Azure CLI authentication

## Directory Structure

```
.
├── .github/
│   └── workflows/
│       └── terraform-deploy.yaml        # GitHub Actions CI/CD pipeline
├── terraform/
│   ├── modules/
│   │   ├── resourcegroup/               # Resource Group module
│   │   ├── vnet/                        # Virtual Network module
│   │   ├── subnet/                      # Subnet module
│   │   ├── publicip/                    # Public IP module
│   │   ├── storage/                     # Storage Account module
│   │   ├── keyvault/                    # Key Vault module
│   │   └── vm/                          # Virtual Machine module
│   ├── env/
│   │   └── demo/
│   │       └── demo-values.tfvars       # Environment-specific variables
│   ├── web-app/
│   │   └── index.html                   # Interactive web dashboard
│   ├── main.tf                          # Main infrastructure configuration
│   ├── provider.tf                      # Azure provider configuration
│   ├── variables.tf                     # Variable definitions
│   ├── outputs.tf                       # Output definitions
│   └── .terraform.lock.hcl              # Dependency lock file
├── env-values.tfvars                    # Root environment variables
├── README.md                            # This file
└── .gitignore                           # Git ignore patterns
```

## Configuration Files

- **`provider.tf`**: Configures the Azure provider, backend state, and authentication settings
- **`variables.tf`**: Defines all input variables with descriptions and types
- **`main.tf`**: Contains the main infrastructure resource definitions and module calls
- **`outputs.tf`**: Specifies output values exported after deployment
- **`env-values.tfvars`**: Environment-specific variable overrides
- **`.github/workflows/terraform-deploy.yaml`**: Multi-stage CI/CD pipeline with validation, planning, security checks, and deployment
- **`terraform/web-app/index.html`**: Interactive dashboard showing Azure resources and pipeline status

## 🚀 Azure Resources Provisioned

This configuration creates the following Azure resources:

### Core Infrastructure
- **Resource Group**: Logical container for all resources
- **Virtual Network (VNet)**: Network isolation with CIDR block 10.0.0.0/16
- **Subnet**: Subnet configuration with CIDR block 10.0.1.0/24
- **Network Security Group (NSG)**: Security rules for SSH (port 22) and HTTP (port 80)

### Compute & Networking
- **Network Interface**: Attached to VM with NSG
- **Public IP**: Static IP for external access
- **Virtual Machine**: Ubuntu 22.04 LTS running Standard_B2ats_v2 SKU
- **Storage Account**: General Purpose v2 with GRS replication
- **Key Vault**: Secure credential and secret storage

### Application Layer
- **NGINX Web Server**: Pre-installed and configured
- **Custom Web Dashboard**: Interactive UI displaying resource status and pipeline metrics

## Usage

### Local Deployment

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd terraform-iac
   ```

2. **Initialize Terraform**:
   ```bash
   cd terraform
   terraform init
   ```

3. **Validate configuration**:
   ```bash
   terraform validate
   ```

4. **Format check**:
   ```bash
   terraform fmt -check
   ```

5. **Plan deployment** (dry-run):
   ```bash
   terraform plan \
     -var="vm_admin_password=$YOUR_PASSWORD" \
     -var-file="env/demo/demo-values.tfvars"
   ```

6. **Apply configuration** (create resources):
   ```bash
   terraform apply \
     -var="vm_admin_password=$YOUR_PASSWORD" \
     -var-file="env/demo/demo-values.tfvars" \
     -auto-approve
   ```

### GitHub Actions CI/CD Pipeline

The repository includes an automated CI/CD pipeline with the following stages:

1. **Checkout**: Clone repository code
2. **Setup**: Install and configure Terraform
3. **Validate**: Check Terraform syntax and configuration
4. **Plan**: Generate execution plan
5. **Security Check**: Manual approval gate for security review
6. **Deploy**: Apply Terraform configuration to Azure

**Required GitHub Secrets**:
- `ARM_SUBSCRIPTION_ID`: Azure subscription ID
- `ARM_CLIENT_ID`: Azure service principal client ID
- `ARM_TENANT_ID`: Azure tenant ID
- `VM_ADMIN_PASSWORD`: VM administrator password

**Trigger**: Manual workflow dispatch via GitHub Actions interface

## Web Dashboard

After deployment, access the interactive web dashboard at `http://<public-ip-address>` to:
- View all provisioned Azure resources with status
- Monitor GitHub Actions pipeline execution
- Check deployment information and details
- Copy deployment configuration details

## Outputs

After successful deployment, Terraform outputs:

```
public_ip_address = "<VM-public-IP>"
resource_group_name = "demo-nginx-rg"
virtual_network_id = "/subscriptions/.../virtualNetworks/demo-vnet"
subnet_id = "/subscriptions/.../subnets/demo-subnet"
vm_id = "/subscriptions/.../virtualMachines/demovm"
storage_account_id = "/subscriptions/.../storageAccounts/aissalesdemostorage"
key_vault_id = "/subscriptions/.../vaults/ais-salesdemokeyvault"
```

## Security Best Practices

- ✅ Network Security Groups restrict ingress traffic
- ✅ Azure Key Vault secures sensitive credentials
- ✅ Service principal authentication via OIDC in GitHub Actions
- ✅ State file stored securely in Azure Storage
- ✅ Sensitive variables excluded from version control
- ✅ Manual approval gates in CI/CD pipeline
- ✅ Terraform plan review before deployment

## Troubleshooting

### Authentication Issues
```bash
# Verify Azure CLI login
az account show

# Set subscription context
az account set --subscription <subscription-id>
```

### Terraform State Issues
```bash
# Refresh state from Azure
terraform refresh

# View current state
terraform state list
terraform state show <resource-name>
```

### Resource Deletion
```bash
# Destroy all resources
terraform destroy \
  -var="vm_admin_password=$YOUR_PASSWORD" \
  -var-file="env/demo/demo-values.tfvars" \
  -auto-approve
```

## Environment-Specific Configuration

Create environment-specific variable files in `terraform/env/<environment>/`:

```hcl
# terraform/env/prod/prod-values.tfvars
location = "eastus"
environment = "prod"
vm_size = "Standard_D4s_v5"
tags = {
  environment = "production"
  owner       = "ops-team"
}
```

## Module Documentation

Each module has its own `variables.tf` and `outputs.tf`:

- **resourcegroup**: Outputs `rgName`, `rgLocation`, `rgId`
- **vnet**: Outputs `vnetName`, `vnetId`
- **subnet**: Outputs `subnetId`, `subnetName`
- **publicip**: Outputs `public_ip_address`, `public_ip_address_id`
- **storage**: Outputs `storage_account_uri`, `storage_account_id`
- **keyvault**: Outputs `key_vault_id`, `key_vault_name`
- **vm**: Outputs `vm_id`, `vm_public_ip`

## Contributing

1. Create a feature branch: `git checkout -b feature/enhancement`
2. Make changes and validate: `terraform validate && terraform fmt`
3. Commit changes: `git commit -m "Add: description"`
4. Push to remote: `git push origin feature/enhancement`
5. Create Pull Request for review

## License

This project is licensed under the Mozilla Public License Version 2.0. See the LICENSE file for details.

## Support & Feedback

For issues, questions, or feedback:
- Create an issue in GitHub repository
- Review Terraform Azure provider documentation
- Check Azure CLI error messages and logs

---

**Last Updated**: January 2026  
**Terraform Version**: 1.9.8+  
**Azure Provider**: 4.57.0+  
**Maintained By**: GitHub Team
