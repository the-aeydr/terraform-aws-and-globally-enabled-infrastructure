resource "aws_ec2_transit_gateway" "default" {
  description = "Regional gateway from the global Transit Gateway"

    # This should have an offset for the system
  amazon_side_asn                 = 4200000000 # to 4294967294  
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"

  tags = {
    Name = "{suffix} {region}"
  }
}

resource "aws_ram_resource_share" "default" {
  name                      = "{suffix}SharedToOrganization"
  allow_external_principals = true

 tags = {
    Name = "{suffix} {region}"
  }
}