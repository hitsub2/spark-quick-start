module "emr_containers" {
  source  = "terraform-aws-modules/emr/aws//modules/virtual-cluster"
  version = "~> 1.0"

  eks_cluster_id    = module.eks.cluster_name
  oidc_provider_arn = module.eks.oidc_provider_arn

  name      = "${module.eks.cluster_name}-emr"
  namespace = var.emr-namespace

  role_name                = "${module.eks.cluster_name}-emr-execution-role"
  iam_role_use_name_prefix = false
  iam_role_description     = "EMR Execution Role for emr kes"
  # NOTE: S3 full access added only for testing purpose. You should modify this policy to restrict access to S3 buckets
  iam_role_additional_policies = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]
  cloudwatch_log_group_name    = "/emr-on-eks-logs/${module.eks.cluster_name}/emr-eks"

  tags = merge(local.tags, { Name = "emr-eks" })
}