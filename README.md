# Terraform Azure Infrastructure Setup

This repository contains Terraform configuration files to deploy an Azure infrastructure that includes a resource group, virtual network, subnet, public IP, network interface, and a Linux virtual machine running NGINX.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- An Azure account with the necessary permissions to create resources.
- Azure CLI installed and configured, or service principal credentials stored in GitHub secrets.

## Directory Structure

```
.
├── .gitignore
├── .terraform.lock.hcl
├── env-values.tfvars
├── main.tf
├── outputs.tf
├── provider.tf
├── variables.tf
└── .github/
    └── workflows/
        └── terraform-deploy.yaml
```

## Configuration Files

- **`provider.tf`**: Configures the Azure provider and backend for storing the Terraform state.
- **`variables.tf`**: Defines the variables used in the Terraform configuration.
- **`main.tf`**: Contains the main infrastructure resources to be created.
- **`outputs.tf`**: Specifies the outputs from the Terraform deployment.
- **`env-values.tfvars`**: Contains environment-specific variable values.
- **`.github/workflows/terraform-deploy.yaml`**: GitHub Actions workflow for automating the deployment process.

## Usage

1. **Clone the repository**:
   ```sh
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Set up your Azure credentials**:
   Ensure that your Azure credentials are set in your environment or as GitHub secrets for the GitHub Actions workflow.

3. **Initialize Terraform**:
   ```sh
   terraform init
   ```

4. **Validate the configuration**:
   ```sh
   terraform validate
   ```

5. **Plan the deployment**:
   ```sh
   terraform plan -var-file="env-values.tfvars"
   ```

6. **Apply the configuration**:
   ```sh
   terraform apply -var-file="env-values.tfvars"
   ```

## Outputs

After a successful deployment, you will see an output message indicating the URL where the NGINX application is accessible.

## GitHub Actions

The repository includes a GitHub Actions workflow that automatically deploys the infrastructure when changes are pushed to the `main` branch. Ensure that the necessary secrets are configured in your GitHub repository settings.

## License

This project is licensed under the Mozilla Public License Version 2.0. See the [LICENSE](.terraform/providers/registry.terraform.io/hashicorp/azurerm/4.57.0/windows_amd64/LICENSE.txt) file for details.