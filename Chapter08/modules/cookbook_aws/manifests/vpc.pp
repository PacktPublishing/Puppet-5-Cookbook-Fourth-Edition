# virtual private cloud
class cookbook_aws::vpc {
  ec2_vpc {'cookbook_aws':
    ensure     => present,
    region     => $cookbook_aws::region,
    cidr_block => '10.0.0.0/16',
  }
  ec2_vpc_internet_gateway {'cookbook_aws-gateway':
    ensure => present,
    region => $cookbook_aws::region,
    vpc    => $cookbook_aws::vpc,
  }
}
