#TaskHub
TaskHub is a cloud-native task management web application built with Python Flask, containerised with Docker, and deployed on Microsoft Azure using modern DevOps practices.
The application allows users to create, manage, and track tasks with priority levels, categories, due dates, and completion status — all served securely over HTTPS via a custom domain.

##Tech Stack

Application: Python Flask
Containerisation: Docker
Cloud Provider: Microsoft Azure
Infrastructure as Code: Terraform
CI/CD: GitHub Actions
Container Registry: Azure Container Registry (ACR)
Hosting: Azure Container Apps
DNS & CDN: Azure Front Door + Cloudflare

##Architecture
The project follows a fully automated cloud deployment pipeline:

Code is pushed to GitHub, triggering GitHub Actions pipelines
The Docker image is built, tested, and pushed to ACR
Terraform provisions and manages all Azure infrastructure
Azure Front Door routes HTTPS traffic to the Container App
Cloudflare handles DNS resolution for the custom domain

##Project Goals

Containerise Task Manager app
Push it securely to Azure Container Registry (ACR)
Provision infrastructure as code using Terraform
Enable end-to-end CI/CD using GitHub Actions
Serve the app publicly via custom HTTPS domain using Azure Front Door, with DNS resolution managed by Cloudflare
