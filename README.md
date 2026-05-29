# TaskHub
TaskHub is a cloud-native task management web application built with Python Flask, containerised with Docker, and deployed on Microsoft Azure using modern DevOps practices.
The application allows users to create, manage, and track tasks with priority levels, categories, due dates, and completion status — all served securely over HTTPS via a custom domain.

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
├── images/                           # Architecture diagrams
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


## Project Goals

Containerise Task Manager app
Push it securely to Azure Container Registry (ACR)
Provision infrastructure as code using Terraform
Enable end-to-end CI/CD using GitHub Actions
Serve the app publicly via custom HTTPS domain using Azure Front Door, with DNS resolution managed by Cloudflare
