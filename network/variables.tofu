variable "vpc_cidr" {
  type        = string
  description = "The IPV4 CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "name_tag" {
  type        = string
  description = "The name tag used for all resources"
  default     = "tofu-lab"

  validation {
    condition     = strcontains(var.name_tag, "tofu-lab")
    error_message = "All resources must contain the tag name: \"tofu-lab\""
  }
}
