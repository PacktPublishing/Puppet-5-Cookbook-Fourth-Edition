class cookbook_aws::nat {
  ec2_instance { 'cookbook_aws-nat':
    ensure                      => present,
    region                      => 'us-west-2',
    availability_zone           => 'us-west-2a',
    image_id                    => 'ami-07eb707f',
    instance_type               => 't2.micro',
    monitoring                  => false,
    key_name                    => 'cookbook',
    security_groups             => ['cookbook-sg-nat'],
    subnet                      => 'cookbook_aws-pub',
    associate_public_ip_address => true,
  }
}
