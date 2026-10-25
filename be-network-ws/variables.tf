variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"

}




variable "vpc-name" {
  description = "VPC Name"
  type        = string
  default     = "my-vpc"
}

variable "vpc-cidr" {
  description = "VPC CIDR Range"
  type        = string
  default     = "192.168.0.0/16"
}

variable "based-tags" {
  description = "tags for all resources"
  type        = map(string)
  default = {
    "environment" = "dev"
    "createdBy"   = "terraform"
  }
}
