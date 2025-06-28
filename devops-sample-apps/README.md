# devops-sample-apps

Update fork of [DevOps Sample Apps](https://github.com/DocPlanner/devops-sample-apps)

## golang

Application in runtime needs p12 file(filename: file.p12) next to application binary.

## php

Application to run on production needs env `APP_ENV=prod` and file `config` next to index.php,
repository contains `config.prod` and `config.dev`, for production purposes `config.prod` needs to be renamed to `config`.

## Solution

Built and uploaded both images to personal repository on Dockerhub.
They now resides in `pkobielak/docplanner-go-app` and `pkobielak/docplanner-php-app`.

Otherwise would create relevant AWS ECR repositories and push images there.
