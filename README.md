# Terraform IAC POC

This project demonstrates Infrastructure as Code (IAC) using Terraform to provision and manage Azure resources. The configuration provisions a resource group, a storage account, and a storage container in Azure.

## Features

- Creates an Azure Resource Group.
- Deploys an Azure Storage Account.
- Creates a private Storage Container within the Storage Account.
- Uses Terraform's remote backend for state management.

## Prerequisites

Before using this project, ensure you have the following:

1. **Terraform**: Install Terraform (v1.3 or later).
2. **Azure CLI**: Install the Azure CLI and authenticate using `az login`.
3. **Azure Subscription**: Ensure you have an active Azure subscription.
4. **Backend Configuration**: Update the backend configuration in `provider.tf` with your Azure storage details.

## Project Structure

```
terraform-iac-poc/
├── .gitignore                # Files and directories to ignore in version control
├── main.tf                   # Main Terraform configuration
├── provider.tf               # Provider and backend configuration
├── variables.tf              # Input variables for the project
├── README.md                 # Project documentation
```

## Usage

Follow these steps to deploy the resources:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/terraform-iac-poc.git
   cd terraform-iac-poc
   ```

2. **Initialize Terraform**:
   Initialize the Terraform working directory and download the required provider plugins.
   ```bash
   terraform init
   ```

3. **Validate the Configuration**:
   Ensure the configuration is valid.
   ```bash
   terraform validate
   ```

4. **Plan the Deployment**:
   Generate and review an execution plan.
   ```bash
   terraform plan
   ```

5. **Apply the Configuration**:
   Deploy the resources to Azure.
   ```bash
   terraform apply
   ```

6. **Destroy the Resources** (Optional):
   If you want to clean up the resources, run:
   ```bash
   terraform destroy
   ```

## Variables

The following variables are defined in `variables.tf`:

| Variable Name                    | Description                          | Default Value             |
|----------------------------------|--------------------------------------|---------------------------|
| `resource_group_name`            | Name of the resource group           | `tf-iac-poc-rg`           |
| `location`                       | Azure region for resource deployment | `East US`                 |
| `storage_account_name`           | Name of the storage account          | `terraformiacpocsa`       |
| `storage_account_container_name` | Name of the storage container        | `iacpoccontainer`         |
| `tags`                           | Tags to apply to resources           | `{ environment = "poc" }` |

## Backend Configuration

The Terraform state is stored remotely in an Azure Storage Account. Update the `provider.tf` file with your backend details:

```hcl
backend "azurerm" {
  resource_group_name  = "your-tfstate-rg"
  storage_account_name = "your-tfstate-sa"
  container_name       = "your-tfstate-container"
  key                  = "terraform.tfstate"
}
```

## License

This project is licensed under the [MIT License](LICENSE).

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## Author

**Chandra Srinath**  
For any questions, feel free to reach out.

---

Happy Terraforming! 🚀