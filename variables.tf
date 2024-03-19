variable "create" {
  description = "Controls if EKS resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}

variable "create_cluster_primary_security_group_tags" {
  description = "Indicates whether or not to tag the cluster's primary security group. This security group is created by the EKS service, not the module, and therefore tagging is handled after cluster creation"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the VPC and EKS Cluster"
  type        = string
  default     = "emr-eks-karpenter"
}
variable "region" {
  description = "Region"
  default     = "us-west-2"
  type        = string
}
variable "eks_cluster_version" {
  description = "EKS Cluster version"
  type        = string
  default     = "1.28"
}
variable "emr-namespace" {
  description = "emr namespace"
  type        = string
  default     = "emr-eks"
}


variable "prometheus_stack_version" {
  description = "prometheus stack version included prom, grafana, kube-state"
  type        = string
  default     = "56.21.3"
}

variable "grafana_password" {
  description = "grafana password"
  type        = string
  default     = "grafana123"
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "cluster_tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "karpenter-nodepool-name" {
  description = "emr nodepool name"
  type        = string
  default     = "emr-eks-default"
}


# VPC with 2046 IPs (10.1.0.0/21) and 2 AZs
variable "vpc_cidr" {
  description = "VPC CIDR. This should be a valid private (RFC 1918) CIDR range"
  type        = string
  default     = "10.1.0.0/16"
}

variable "karpenter-version" {
  description = "Enable VPC Endpoints"
  type        = string
  default     = "v0.33.1"
}

variable "enable_vpc_endpoints" {
  description = "Enable VPC Endpoints"
  type        = bool
  default     = false
}

variable "enable_emr_spark_operator" {
  description = "Enable the Spark Operator to submit jobs with EMR Runtime"
  type        = bool
  default     = false
}

variable "enable_kubecost" {
  description = "Enable Kubecost add-on"
  type        = bool
  default     = true
}