provider "huaweicloud" {
  region = "ap-southeast-3"
}

module "vpc" {
  source  = "cloud-labs-infra/vpc/huaweicloud"
  version = "1.0.0"

  name        = "dev01"
}

module "gaussdb-redis" {
  source  = "cloud-labs-infra/gaussdb-redis/huaweicloud"
  version = "1.0.0"

  name        = "dev01"
  vpc_id      = module.vpc.vpc_id
  subnet_id   = element(module.vpc.private_subnets_ids, 0)
  secgroup_id = "id of security group"
  tags = {
    "env" : "dev01"
  }
}
