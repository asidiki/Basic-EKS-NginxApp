#eks-cluster.tf
module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "nginxapp-eks-cluster"
    cluster_version = "1.28"

    cluster_endpoint_public_access  = true

    vpc_id = module.nginxapp-vpc.vpc_id
    subnet_ids = module.nginxapp-vpc.private_subnets

    tags = {
        environment = "development"
        application = "nginxapp-server"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 3
            desired_size = 1

            instance_types = ["t2.small"]
        }
    }
}