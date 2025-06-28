# kubernetes-system

Helmfile-driven orchestration of cluster-level add-ons on EKS.

## Structure

- [helmfile.yaml](./helmfile.yaml): defines chart repositories, environments (`test-eu-north-1`, `prod-eu-north-1`), and releases:
  - `ingress-nginx` - for ingress controller to expose services
  - `metrics-server` - for hpa to work
  - `cluster-autoscaler` - for auto-scaling
- [config/](./config): per-release value overrides:
  - `cluster-autoscaler/common.yaml`
  - `ingress-nginx/common.yaml`
  
- *(add `common.yaml` under any release directory for common overrides)*
- *(add `<env>.yaml` under any release directory for environment-specific overrides)*

Additional environment/region pairs can be added to the top of the [helmfile.yaml](./helmfile.yaml) file.

I've predefined two scripts to ease the usage of helmfile for the purpose of this challenge.

- [apply_all.sh](./apply_all.sh): runs `helmfile apply` for both environments
- [diff_all.sh](./diff_all.sh): runs `helmfile diff` for both environments

## Usage

```bash
cd kubernetes-system
# preview all changes
./diff_all.sh
# apply to both clusters
./apply_all.sh
```

Or target a single environment:

```bash
helmfile -f helmfile.yaml -e test-eu-north-1 sync
helmfile -f helmfile.yaml -e prod-eu-north-1 sync
```

## Prerequisites

- Helm 3.x
- Helmfile (compatible version)
- `kubectl` with contexts matching EKS clusters (e.g. `eks-docplanner-test`, `eks-docplanner-prod`)
- AWS credentials configured (env vars or AWS CLI profile)
