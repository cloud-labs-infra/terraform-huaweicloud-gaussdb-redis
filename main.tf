data "huaweicloud_availability_zones" "zones" {
  region = var.region
}

locals {
  availability_zone   = length(var.availability_zones) == 0 ? join(",", slice(data.huaweicloud_availability_zones.zones.names, 0, var.az_number)) : join(",", var.availability_zones)
  redis_instance_name = var.name_postfix == null ? format("%s-redis", var.name) : format("%s-redis-%s", var.name, var.name_postfix)
}

resource "huaweicloud_gaussdb_redis_instance" "main" {
  name              = local.redis_instance_name
  region            = var.region
  availability_zone = local.availability_zone
  flavor            = var.flavor
  node_num          = var.node_num
  volume_size       = var.volume_size
  password          = var.password
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  security_group_id = var.secgroup_id

  datastore {
    engine         = var.datastore.engine
    storage_engine = var.datastore.storage_engine
    version        = var.datastore.version
  }

  lifecycle {
    ignore_changes = [
      password
    ]
  }

  tags = var.tags
}
