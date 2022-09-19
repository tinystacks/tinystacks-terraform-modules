hello_world_aws_region  = "us-east-1"

hello_world_aws_vpc_cidr_block = "10.0.0.0/16"
hello_world_aws_vpc_cidr_newbits = 4

hello_world_public_igw_cidr_blocks = {
  "us-east-1b" = 1
  "us-east-1d" = 2
  "us-east-1f" = 3
}

hello_world_private_ngw_cidr_blocks = {
  "us-east-1b" = 4
  "us-east-1d" = 5
  "us-east-1f" = 6
}

hello_world_private_airgap_cidr_blocks = {
  "us-east-1b" = 7
  "us-east-1d" = 8
  "us-east-1f" = 9
}

hello_world_vpc_security_group_rules = [
  {
    rule_type   = "ingress"
    description = "Ping"
    from_port   = 0
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    rule_type   = "ingress"
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    rule_type   = "egress"
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

hello_world_aws_ami_filter_name_values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
hello_world_aws_ami_owners = ["099720109477"]
hello_world_aws_instance_type = "t2.micro"
hello_world_aws_instance_key_name = "tinystacks_terraform_aj"

acme_aws_ecs_cluster_name = "acme"
acme_api_aws_ecs_service_name = "acme-api"

acme_api_alb_aws_security_group_rules = [
  {
    rule_type   = "ingress"
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    rule_type   = "ingress"
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    rule_type   = "egress"
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

acme_api_aws_alb_internal = false
acme_api_aws_alb_load_balancer_type = "application"
acme_api_aws_lb_target_group_port = 3000
acme_api_aws_lb_target_group_protocol = "HTTP"
acme_api_aws_lb_target_group_target_type = "ip"
acme_api_aws_lb_target_group_health_check_enabled = true
acme_api_aws_lb_target_group_health_check_path = "/health"
acme_api_aws_alb_listener_port = "80"
acme_api_aws_alb_listener_protocol = "HTTP"
acme_api_aws_alb_listener_default_action_type = "forward"

acme_api_aws_security_group_rules = [
  {
    rule_type   = "ingress"
    description = "acme-api"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    rule_type   = "egress"
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

acme_api_aws_ecs_service_launch_type = "FARGATE"
acme_api_aws_ecs_task_definition_container_definitions = <<EOF
  [
    {
      "name": "acme-api",
      "image": "ajjester/acme-api:latest",
      "portMappings": [
        {
          "containerPort": 3000
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-region": "us-east-1",
          "awslogs-group": "/ecs/acme-api",
          "awslogs-stream-prefix": "ecs"
        }
      }
    }
  ]
  EOF
acme_api_aws_ecs_task_definition_cpu = 256
acme_api_aws_ecs_task_definition_memory = 512
acme_api_aws_ecs_task_definition_requires_compatibilities = ["FARGATE"]
acme_api_aws_ecs_service_desired_count = 1
acme_api_aws_iam_role_ecs_task_execution_role_name = "ecs-task-execution-role"