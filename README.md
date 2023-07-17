# README - Deployment of spcae-beacon app

Terraform module to provision eks and deploy app using helm
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Summary

The Code consists of three parts -- </BR>
    1. AWS Infra for EKS</BR>
    2. Docker image creation and uploaded to ECR
    3. Deploment through Helm

## Providers

| Name | Version |
|------|---------|
| terraform | latest version is fine |
| aws | "5.8.0" |

## Inputs for Terraform

This code will run through a terraform cloud workspace.

|     Name     |    Description   | Type  | Default | Required |
|--------------|------------------|-------|---------|----------|
| AWS_REGION  | Region of Deployment | `string` | `eu-west-2` | no |
| AWS_ACCESS_KEY_ID  | ACCESS_KEY | `string` | | yes |
| AWS_SECRET_ACCESS_KEY  | SECRET_ACCESS_KEY | `string` |        | yes |

## Outputs from Host Module

| Name | Description |
|------|-------------|
| cluster_name | Name of the eks cluster created |
| cluster_endpoint | Cluster Endpoint |

## Steps to perform sequentially

 `terraform fmt`
 `terraform validate`
 `terraform plan`
 `terraform apply`

 `aws eks --region eu-west-2 update-kubeconfig --name challenge-accepted`
 `kubectl get svc`

 `cd helm`
 `helm create space-beacon`
 `helm install space-beacon space-beacon`

 `kubectl get svc`

Now, copy the external Ip and hit the browser.

For more help read the space-beacon.docx present in same directory.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->