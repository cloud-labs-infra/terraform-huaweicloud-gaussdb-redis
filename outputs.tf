output "id" {
  description = "Specifies a resource ID in UUID format"
  value       = huaweicloud_gaussdb_redis_instance.main.id
}

output "status" {
  description = "Indicates the DB instance status"
  value       = huaweicloud_gaussdb_redis_instance.main.status
}

output "port" {
  description = "Indicates the database port"
  value       = huaweicloud_gaussdb_redis_instance.main.port
}

output "mode" {
  description = "Indicates the instance type"
  value       = huaweicloud_gaussdb_redis_instance.main.mode
}

output "db_user_name" {
  description = "Indicates the default username"
  value       = huaweicloud_gaussdb_redis_instance.main.db_user_name
}

output "nodes" {
  description = "Indicates the instance nodes information"
  value       = huaweicloud_gaussdb_redis_instance.main.nodes
}

output "private_ips" {
  description = "Indicates the IP address list of the db"
  value       = huaweicloud_gaussdb_redis_instance.main.private_ips
}

output "lb_ip_address" {
  description = "Indicates the LB IP address of the db"
  value       = huaweicloud_gaussdb_redis_instance.main.lb_ip_address
}

output "lb_port" {
  description = "Indicates the LB port of the db"
  value       = huaweicloud_gaussdb_redis_instance.main.lb_port
}
