locals {
  file_data = file("${path.module}/ServiceTags_Public_20241007.json")

  json_data = jsondecode(local.file_data)

  result = {
    for value in local.json_data.values : value.name => {
      ipv4 = [
        for prefix in flatten(value.properties.addressPrefixes) : prefix
        if can(regex("\\.", prefix))
      ]
      ipv6 = [
        for prefix in flatten(value.properties.addressPrefixes) : prefix
        if can(regex(":", prefix))
      ]
    }
  }
}


