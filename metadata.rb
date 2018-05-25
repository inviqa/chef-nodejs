maintainer       'Felicity Ratcliffe'
maintainer_email 'fratcliffe@inviqa.com'
license          'Apache 2.0'
description      'Installs nodejs'
name             'nodejs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'yum'

%w(redhat centos).each do |os|
  supports os
end

recipe 'nodejs', 'Installs NodeJS 10.x from nodesource repo'
