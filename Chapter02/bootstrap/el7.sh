#!/bin/bash
# bootstrap for EL7 distributions
SERVER=git.example.com
LOCATION=/bootstrap
BOOTSTRAP=bootstrap.pp
USER=bootstrap
PASS=cookbook
# install puppet
curl -sS http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs >/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs
yum -y install http://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
yum -y install puppet-agent
# download bootstrap
curl -sS --user $USER:$PASS http://$SERVER/$LOCATION/$BOOTSTRAP >/tmp/$BOOTSTRAP
# apply bootstrap
cd /tmp
/opt/puppetlabs/bin/puppet apply /tmp/$BOOTSTRAP
# apply puppet
/opt/puppetlabs/bin/puppet apply --modulepath /usr/local/git/cookbook/modules \
  /usr/local/git/cookbook/manifests/site.pp
