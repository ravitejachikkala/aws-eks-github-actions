provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "my-github-eks-cluster"  # Replace with your desired cluster name
  version  = "1.25.9"  # Replace with your desired EKS version
  role_arn = aws_iam_role.my_cluster_role.arn
  
  vpc_config {
    subnet_ids = ["subnet-0c519e7a371ec2fd6", "subnet-0f7429a6beebb71fb"]  # Replace with your desired subnet IDs
  }
}

resource "aws_iam_role" "my_cluster_role" {
  name = "my-eks-cluster-role"  # Replace with your desired role name
  
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "eks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  EOF
}

resource "aws_iam_role_policy_attachment" "my_cluster_role_policy_attachment" {
  role       = aws_iam_role.my_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
