# an instance
class cookbook_aws::instance (
  String $image_id      = 'ami-07eb707f',
  String $instance_type = 't2.micro',
) {
  ec2_instance {'cookbook':
    ensure                      => running,
    region                      => $cookbook_aws::region,
    image_id                    => $image_id,
    instance_type               => $instance_type,
    monitoring                  => false,
    key_name                    => 'cookbook',
    security_groups             => ['cookbook-securitygroup'],
    subnet                      => 'cookbook_aws-public',
    associate_public_ip_address => true,
  }
}
