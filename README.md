# AWS Load Balancer Infrastructure
This project is an implementation of a load balancing infrastructure on AWS using Terraform.

The infrastructure consists of:

- A VPC with 3 public subnets in 3 different availability zones.
- An Internet Gateway to allow the VPC to communicate with the Internet.
- A security group for the load balancer and a security group for the application.
- Two EC2 instances: one for the load balancer and one for the application.
- A Route Table for the public subnets.

## Prerequisites

To use this project, you will need:

- An AWS account with your credentials properly configured.
- AWS CLI installed.
- Terraform installed on your machine.

## Usage

Clone the repository:
```sh
git clone https://git.cloudavise.com/visops/t054/first-project/terraform-ec2-vpc.git
```

Navigate to the project directory:
```sh
cd aws-load-balancer
```

Create a `terraform.tfvars` file to store your variables. See the `variables.tf` file for the list of variables needed.

Initialize Terraform:
```sh
terraform init
```

Create an execution plan:
```sh
terraform plan
```

Apply the changes:
```sh
terraform apply
```

When you are finished, destroy the infrastructure:
```sh
terraform destroy
```

## Resources Created

- `aws_vpc`: A VPC with a CIDR block of `10.0.0.0/23`.
- `aws_subnet`: Three public subnets, one in each of the `us-east-1a`, `us-east-1b`, and `us-east-1c` availability zones.
- `aws_internet_gateway`: An Internet Gateway attached to the VPC.
- `aws_route_table`: A Route Table associated with the public subnets.
- `aws_route_table_association`: The association between the Route Table and the subnets.
- `aws_instance`: Two EC2 instances: one for the load balancer and one for the application.
- `aws_security_group`: Two security groups: one for the load balancer and one for the application.

