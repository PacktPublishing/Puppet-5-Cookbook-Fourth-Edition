# AWS class
class cookbook_aws (
  String $availability_zone = 'us-west-2a',
  String $region            = 'us-west-2',
  String $vpc               = 'cookbook_aws',
) {
  include cookbook_aws::instance
  include cookbook_aws::network
  include cookbook_aws::securitygroup
  include cookbook_aws::vpc
  Class['cookbook_aws::vpc']
    -> Class['cookbook_aws::securitygroup']
    -> Class['cookbook_aws::network']
    -> Class['cookbook_aws::instance']
}
