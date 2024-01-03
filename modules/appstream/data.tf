data "aws_security_groups" "selected" {
    for_each = var.security_group_ids

    filter {
      name = "group-name"
      values = each.value
    }
}

data "aws_subnets" "selected" {
    for_each = var.subnet_ids

    filter {
        name = "tag:Name"
        values = each.value
    }
}