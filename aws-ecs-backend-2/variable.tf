# Provider
variable "aws_access_key" {
  description = "The IAM public access key for connecting to AWS"
  type        = string
}

variable "aws_secret_key" {
  description = "The IAM secret access key for connecting to AWS"
  type        = string
}

variable "aws_region" {
  description = "The AWS region that resources will be created on"
  type        = string
}

# ECS
variable "ecs_auto_scale_role_name" {
  description = "The name of the ECS auto scale role"
  type        = string
  default     = "myEcsAutoScaleRole"
}

variable "ecs_min_instances" {
  description = "The minimum number of containers to run"
  type        = number
  default     = 1
}

variable "ecs_max_instances" {
  description = "The maximum number of containers to run"
  type        = number
  default     = 2
}

variable "fargate_cpu" {
  description = "The Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  type        = string
  default     = "1024"
}

variable "fargate_memory" {
  description = "The Fargate instance memory to provision (in MiB)"
  type        = string
  default     = "2048"
}

# Network
variable "az_count" {
  description = "The number of Availability Zones to cover in a given region"
  type        = number
  default     = 2
}

# Application
variable "app_image" {
  description = "The docker image to run in the ECS cluster"
  type        = string
}

variable "app_port" {
  description = "The port exposed by the docker image to redirect traffic to"
  type        = number
  default     = 8080
}

variable "app_count" {
  description = "The number of docker containers to initially start"
  type        = number
  default     = 1
}

variable "health_check_path" {
  description = "The URI to call in order to perform health checks via the load balancer"
  type        = string
  default     = "/actuator/health"
}


