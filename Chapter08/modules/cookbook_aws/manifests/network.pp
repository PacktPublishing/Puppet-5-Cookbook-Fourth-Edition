# network definitions
class cookbook_aws::network {
  # public network
  ec2_vpc_routetable { 'cookbook_aws-route-public':
    ensure => present,
    region => $cookbook_aws::region,
    vpc    => $cookbook_aws::vpc,
    routes => [
      {
        destination_cidr_block => '10.0.0.0/16',
        gateway                => 'local',
      },{
        destination_cidr_block => '0.0.0.0/0',
        gateway                => 'cookbook_aws-gateway',
      }
    ],
  }

  ec2_vpc_subnet {'cookbook_aws-public':
    ensure            => present,
    region            => $cookbook_aws::region,
    vpc               => $cookbook_aws::vpc,
    cidr_block        => '10.0.10.0/24',
    availability_zone => $cookbook_aws::availability_zone,
    route_table       => 'cookbook_aws-route-public',
  }

  #  private network - not used in book
  #ec2_vpc_routetable { 'cookbook_aws-route-private':
  #  ensure => present,
  #  region => $cookbook_aws::region,
  #  vpc    => $cookbook_aws::vpc,
  #  routes => [{
  #    destination_cidr_block => '10.0.0.0/16',
  #    gateway                => 'local',
  #  },{
  #    destination_cidr_block => '0.0.0.0/0',
  #    gateway                => 'cookbook_aws-nat'
  #  },
  #  ]
  #}
  #ec2_vpc_subnet { 'cookbook_aws-private':
  #  ensure            => present,
  #  region            => $cookbook_aws::region,
  #  vpc               => $cookbook_aws::vpc,
  #  cidr_block        => '10.0.20.0/24',
  #  availability_zone => $cookbook_aws::availability_zone,
  #  route_table       => 'cookbook_aws-route-private',
  #}
}
