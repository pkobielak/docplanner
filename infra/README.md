# infra

Terraform & Terragrunt configurations for provisioning AWS infrastructure.

## Structure

- [modules](./modules): self-contained Terraform modules:
  - vpc/ - config for VPC
  - eks/ - config for EKS + managed nodegroups + cluster-autoscaler
  - rds/ - config for RDS
- [live](./live): Terragrunt configuration root:
  - root.hcl: root-level backend and provider settings
  - _env/: base configs (eks.hcl, rds.hcl, vpc.hcl)
  - <environment_name>/: environment-specific configs
    - env.hcl: environment-level locals
    - <region_name>/: region-specific configs
      - region.hcl: region-level locals
      - eks/: Terragrunt include for EKS module
      - rds/: Terragrunt include for RDS module
      - vpc/: Terragrunt include for VPC module

This structure should ensure high configurability and DRYness for multi-region setup following 12factor app principles.

For purposes of this challenge, I have set up:

- single region (eu-north-1),
- two environments (test, prod).

## Usage

```bash
cd live/<env>/<region>/<module_name>
terragrunt init
terragrunt apply
```

## Prerequisites

- Terraform >= 1.12.2
- Terragrunt >= 0.82.1
- AWS credentials configured (env vars or AWS CLI profile)

---

*Note: Remote state stored in S3 with DynamoDB locking.*
