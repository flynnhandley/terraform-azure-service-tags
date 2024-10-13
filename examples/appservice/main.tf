module "tags" {
  source = "../../../terraform-azure-service-tags"
}

output "AppService_AustraliaSoutheast_ipv6" {
    value = module.tags.ActionGroup_ipv6
}

output "AppService_AustraliaSoutheast_ipv4" {
    value = module.tags.ActionGroup_ipv4
}
