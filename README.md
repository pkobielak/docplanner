# docplanner

Solution to a challenge from Docplanner

## Subdirectories

For real production setup each subdirectory would be a separate repository.
Each of them would also hold proper automated CI/CD pipelines.

- devops-sample-apps/: dockerized example microservices (Go, PHP)
- infra/: Terraform/Terragrunt modules provisioning AWS infrastructure (VPC, EKS, IAM)
- kubernetes-system/: Helmfile and manifests for cluster-level addons (autoscaler, monitoring, ingress)
- kubernetes-apps/: Helmfile-driven Helm charts and configs for deploying application workloads
