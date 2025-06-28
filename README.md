# docplanner

Solution proposal to a challenge from Docplanner

## Subdirectories

For real production setup each subdirectory would be a separate repository.
Each of them would also hold proper automated CI/CD pipelines.

- [devops-sample-apps](./devops-sample-apps/): dockerized example microservices (Go, PHP)
- [infra](./infra/): Terraform/Terragrunt modules provisioning AWS infrastructure (VPC, EKS, RDS, IAM)
- [kubernetes-system](./kubernetes-system/): Helmfile-driven setup for cluster-level addons (autoscaler, metrics-server, ingress controller)
- [kubernetes-apps](./kubernetes-apps/): Helmfile-driven setup for deploying business-level application workloads

## Further improvements

- CI/CD pipelines: integrate automated (build/test/deploy) pipelines for each repository.
- Monitoring: add proper observability stack (3pillars) f.ex. Thanos/Prometheus/Grafana + ELK stack + Tempo with OpenTelemetry for tracing.
- Security: integrate best practice enforcement through f.ex. polaris, Kubernetes RBAC policies, container image scanning, runtime security.
- Scalability: configure cluster auto-scaling with Karpenter, spot instance usage.
- Cost optimization: cost observability with kubecost, infracost.
