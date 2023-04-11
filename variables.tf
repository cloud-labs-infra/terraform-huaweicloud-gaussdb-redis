variable "name" {
  description = "Specifies the instance name"
  type        = string
  nullable    = false
}

variable "name_postfix" {
  description = "Specifies the instance name postfix"
  type        = string
  default     = null
}

variable "region" {
  description = "Specifies the region in which to create the resource, if omitted, the provider-level region will be used"
  type        = string
  default     = null
}

variable "az_number" {
  description = "Number of AZ, if 'availability_zones' is omitted, AZ calculates automatically based on this variable"
  type        = number
  default     = 3
}

variable "availability_zones" {
  description = "Specifies the AZ name, if omitted, AZ calculates automatically"
  type        = list(string)
  default     = []
}

variable "flavor" {
  description = "Specifies the instance specifications"
  type        = string
  default     = "geminidb.redis.small.4"
  validation {
    condition     = startswith(var.flavor, "geminidb.redis")
    error_message = "Use the Redis specific Flavor, see https://support.huaweicloud.com/intl/en-us/redisug-nosql/nosql_05_0059.html."
  }
}

variable "volume_size" {
  description = <<DES
  Specifies the storage space in GB
  The minimum and maximum storage space depends on the flavor and nodes_num variables
  See https://support.huaweicloud.com/intl/en-us/redisug-nosql/nosql_05_0059.html
  DES
  type        = number
  default     = 10
}

variable "node_num" {
  description = "Specifies the number of nodes"
  type        = number
  default     = 3
  validation {
    condition     = var.node_num >= 3 && var.node_num <= 36
    error_message = "Specifies the number of nodes, the quantity ranges from 3 to 36."
  }
}

variable "password" {
  description = "Specifies the database password"
  type        = string
  default     = "VerY_5tr0nG-Pa55w0R^d"
  validation {
    condition     = length(var.password) >= 8 && length(var.password) <= 32
    error_message = "The value must be 8 to 32 characters in length, including uppercase and lowercase letters, digits, and special characters, such as ~!@#%^*-_=+?"
  }
}

variable "vpc_id" {
  description = "Specifies the VPC ID"
  type        = string
  nullable    = false
}

variable "subnet_id" {
  description = "Specifies the network ID of a subnet"
  type        = string
  nullable    = false
}

variable "secgroup_id" {
  description = "Specifies the security group ID, required if the selected subnet doesn't enable network ACL"
  type        = string
}

variable "datastore" {
  description = "Specifies the database information"
  type = object({
    engine         = optional(string, "redis")
    storage_engine = optional(string, "rocksDB")
    version        = optional(string, "5.0")
  })
  default = {}
}

variable "tags" {
  description = "Specifies the key/value pairs to associate with the Gaussdb Redis Instance"
  type        = map(string)
  default     = {}
}
