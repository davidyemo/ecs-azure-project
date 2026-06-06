# TaskHub
TaskHub is a cloud-native task management web application built with Python Flask, containerised with Docker, and deployed on Microsoft Azure using modern DevOps practices.
The application allows users to create, manage, and track tasks with priority levels, categories, due dates, and completion status — all served securely over HTTPS via a custom domain.

### Project Goals

- Containerise Task Manager app
- Push it securely to Azure Container Registry (ACR)
- Provision infrastructure as code using Terraform
- Enable end-to-end CI/CD using GitHub Actions
- Serve the app publicly via custom HTTPS domain using Azure Front Door, with DNS resolution managed by Cloudflare

## Architecture Diagram

![TaskHub Architecture](images/ecs-image1.png)

## TaskHub Demo

<img width="793" height="373" alt="TaskHub_Recording-ezgif com-crop" src="https://github.com/user-attachments/assets/e52085d3-037c-40c1-a83e-f35b7ff017c4" />







## Tech Stack

| Category | Technology |
|---|---|
| Application | Python Flask |
| Containerisation | Docker |
| Cloud Provider | Microsoft Azure |
| Infrastructure as Code | Terraform |
| CI/CD | GitHub Actions |
| Container Registry | Azure Container Registry (ACR) |
| Hosting | Azure Container Apps |
| DNS & CDN | Azure Front Door + Cloudflare |

## Architecture
The project follows a fully automated cloud deployment pipeline:

Code is pushed to GitHub, triggering GitHub Actions pipelines
The Docker image is built, tested, and pushed to ACR
Terraform provisions and manages all Azure infrastructure
Azure Front Door routes HTTPS traffic to the Container App
Cloudflare handles DNS resolution for the custom domain

## Project Structure

```
taskhub-azure-project/
├── .github/
│   └── workflows/
│       ├── push-docker-image.yml     # CI: Build and push Docker image to ACR
│       ├── terraform-plan.yml        # CI: Terraform plan to preview changes
│       ├── terraform-apply.yml       # CD: Terraform apply to deploy infra
│       └── terraform-destroy.yml     # CD: Terraform destroy to tear down infra
│
├── app/                              # Task manager app
│   ├── static/
│   │   ├── script.js
│   │   └── style.css
│   ├── templates/
│   │   └── index.html
│   ├── app.py
│   └── requirements.txt
│
├── images/                           
│
├── terraform/
│   ├── modules/                      # Terraform modules for reusable infra
│   │   ├── acr/                      # Azure Container Registry module
│   │   ├── container-app/            # Azure Container App module
│   │   └── frontdoor/                # Azure Front Door module
│   ├── state-storage/                # Remote backend state storage config
│   ├── .terraform.lock.hcl
│   ├── main.tf
│   ├── providers.tf
│   └── variables.tf
│
├── .gitignore
├── Dockerfile
└── README.md
```

## Workflow

### 1. Containerize the App and Push to ACR

- Built a Docker image from the Python Flask app
- Created Azure Container Registry (ACR) using Terraform
- Tagged and pushed the image to ACR

### 2. CI/CD Pipelines

**Docker Pipeline** — triggers on push to main
- Builds and tests the Docker image
- Pushes the image to ACR

**Terraform Plan** — triggers on pull request to main
- Runs `terraform plan` to preview infrastructure changes
- Runs tfsec security scan on Terraform code

**Terraform Apply** — triggers on push to main
- Runs `terraform apply` to deploy infrastructure changes to Azure

**Terraform Destroy** — manually triggered
- Runs `terraform destroy` to tear down all Azure infrastructure

### 3. Terraform deployment

Terraform is used to provision and manage all Azure infrastructure as code. 
Resources are organised into reusable modules, making the configuration clean and maintainable. 
The remote state is stored in an Azure Storage Account so both local and CI/CD pipeline deployments share the same state, preventing conflicts.

### 4. Expose Application via HTTPS

The application is exposed publicly using **Azure Front Door** provisioned via Terraform. Front Door handles HTTPS termination, routes traffic to the Container App, and serves the app via a custom domain.

**Custom Domain:** `https://tm.dyemo.co.uk`  
**DNS:** Managed by Cloudflare with a CNAME record pointing to the Front Door endpoint  
**SSL Certificate:** Automatically issued and managed by Azure Front Door

### 5. Custom Domain

The app is accessible via a custom domain `tm.dyemo.co.uk` configured through Cloudflare and Azure Front Door.

**Cloudflare DNS configuration:**
- A `CNAME` record pointing `tm` to the Front Door endpoint
- Proxy status set to **DNS only** — required for Front Door SSL certificate validation

## GitHub Secrets

GitHub secrets are referenced within CI/CD workflows to authenticate with external services such as Azure by injecting credentials (e.g., client ID, tenant ID, and client secret) into GitHub Actions workflows as environment variables, enabling secure login and deployment without exposing sensitive information in the codebase.

## GitHub Actions (CI/CD)

### Push Docker Image to ACR

<img width="733" height="617" alt="docker-pipeline" src="https://github.com/user-attachments/assets/187e038b-0d7c-4623-9c4e-d491e1d6942a" />

### Terraform Plan

<img width="767" height="589" alt="Terraform-plan" src="https://github.com/user-attachments/assets/5bc6a65c-c27e-4677-b866-6b0acb531958" />

### Terraform Apply

<img width="671" height="547" alt="Terraform-apply" src="https://github.com/user-attachments/assets/cb53e14f-836d-438e-b279-9ccf177c817e" />


### Terraform Destroy

<img width="714" height="519" alt="Terraform-destroy" src="https://github.com/user-attachments/assets/3ab7355d-fd34-4475-ad51-33a22d378d61" />


## Azure Container app and Front Door

### Azure Container Apps Overview

<img width="1913" height="438" alt="container-apps-overview" src="https://github.com/user-attachments/assets/59f46db4-56f7-47ef-8cfb-04154f51b4b8" />

<img width="1600" height="874" alt="application-url" src="https://github.com/user-attachments/assets/88f7051e-a9ad-453b-85f8-aace88bf0e09" />

### Azure Front Door Route and Dns Configuration

<img width="1088" height="205" alt="frontdoor-route" src="https://github.com/user-attachments/assets/4fede13a-d131-46e3-a381-7406d42d5b02" />

### Endpoint Overview

<img width="1643" height="863" alt="endpoint" src="https://github.com/user-attachments/assets/db83b1d4-929a-4bda-b466-df5da1ed832a" />

## Website Link: https://tm.dyemo.co.uk/





