# security group
class cookbook_aws::securitygroup {
  ec2_securitygroup { 'cookbook-securitygroup':
    ensure      => present,
    region      => $cookbook_aws::region,
    vpc         => $cookbook_aws::vpc,
    description => 'Security group for cookbook',
    ingress     => [ {
      protocol => 'tcp',
      port     => 22,
      cidr     => '0.0.0.0/0',
    }]
  }
}
