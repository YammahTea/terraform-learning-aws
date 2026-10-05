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

variable "subnets" {

  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))

  description = "A collection of subnets with their default configurations"

  default = {
    "1a-public-01" = {
      cidr_block              = "10.0.1.0/24"
      availability_zone       = "eu-north-1a"
      map_public_ip_on_launch = true
    }

    "1b-private-01" = {
      cidr_block              = "10.0.2.0/24"
      availability_zone       = "eu-north-1b"
      map_public_ip_on_launch = false
    }
  }

  # Checks if the keys of the subnets configurations match a naming convention
  validation {
    condition = alltrue(
      [for key in keys(var.subnets) : can(regex("^1[a-c]-(public|private)-[0-9]+$", key))]
    )
    error_message = "All subnets must follow the naming convention (e.g., '1a-public-01' or '1b-private-02')"
  }
}
