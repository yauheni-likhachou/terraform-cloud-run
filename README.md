## terraform-cloud-run

---

### Folder Structure Expanded
```plaintext
terraform-cloudrun-project/
├── terraform/
│   ├── main.tf                # Defines Cloud Run deployment infrastructure
│   ├── variables.tf           # Variables to make configuration reusable
│   ├── outputs.tf             # Outputs from the Terraform execution
│   ├── terraform.tfvars       # Actual values for project-specific variables
│   ├── .terraform.lock.hcl    # Auto-generated after `terraform init`
├── app/
│   ├── app.py                 # Sample Flask web app for the Cloud Run service 
│   ├── Dockerfile             # Instructions to create a containerized version of the app
├── README.md                  # Instructions and project overview