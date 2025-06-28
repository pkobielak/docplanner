# kubernetes-apps

Helmfile-driven orchestration of business-level application workloads on EKS.

## Structure

- [helmfile.yaml](./helmfile.yaml): defines environments (`test-eu-north-1`, `prod-eu-north-1`), templates, and releases:
  - `php-app`: deployment config for `php-app` chart
  - `go-app`: deployment config for `go-app` chart
- [charts/](./charts): local Helm charts for each application:
  - `php-app/`
  - `go-app/`
- [config/](./config): per-release value overrides:
  - `php-app/common.yaml`, `php-app/test.yaml`, `php-app/prod.yaml`
  - `go-app/common.yaml`, `go-app/test.yaml`, `go-app/prod.yaml`

*(add `<release>/common.yaml` for common overrides, `<release>/<env>.yaml` for environment-specific overrides)*

Additional environment/region pairs can be added under `environments:` in [helmfile.yaml](./helmfile.yaml).

I've predefined two scripts to ease the usage of helmfile for the purpose of this challenge.

- [apply_all.sh](./apply_all.sh): runs `helmfile apply` for both environments
- [diff_all.sh](./diff_all.sh): runs `helmfile diff` for both environments

## Changes in charts for the purpose of this challenge

- `go-app`:
  - I've added init container to `go-app` deployment to simulate a `file.p12` file being added at runtime.

- `php-app`:
  - I've added extraEnv to values to add `APP_ENV` environment variable.
  - I've added init container to `php-app` deployment to simulate a `config.${APP_ENV}` file being renamed to `config` at runtime depending on the `APP_ENV` environment variable.
  - IMPORTANT! Because of the code, I've assumed it is expected for this application to fail on `test` environment.

## Usage

```bash
cd kubernetes-apps
./diff_all.sh   # preview changes
./apply_all.sh  # apply to both environments
```

Or target a single environment:

```bash
helmfile -f helmfile.yaml -e test-eu-north-1 sync
helmfile -f helmfile.yaml -e prod-eu-north-1 sync
```

## Prerequisites

- Helm 3.x
- Helmfile (compatible version)
- `kubectl` contexts for EKS clusters (`eks-docplanner-test`, `eks-docplanner-prod`)
- AWS credentials (env vars or AWS CLI)
