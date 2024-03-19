################################################################################
# EKS Managed Node Group
################################################################################

output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = "aws eks --region ${local.region} update-kubeconfig --name ${module.eks.cluster_name}"
}

output "emr_on_eks" {
  description = "EMR on EKS"
  value       = module.emr_containers
}

output "emr_s3_bucket_name" {
  description = "S3 bucket for EMR workloads. Scripts,Logs etc."
  value       = module.s3_bucket.s3_bucket_id
}
