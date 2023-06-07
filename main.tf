provider "aws" {
  region = "ap-south-1"
}


module "eks_cluster" {
  source             = "terraform-aws-modules/eks/aws"
  cluster_name       = "my-eks-cluster"
  cluster_version    = "1.21"  # Replace with a supported Kubernetes version
  vpc_id             = "vpc-0d6d2c6204d72763b"
  subnet_ids         = ["subnet-03ea374b93dfca015", "subnet-0f7429a6beebb71fb"]
  
}
