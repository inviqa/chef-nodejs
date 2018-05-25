ruby_block 'yum-cache-reload' do
  block { Chef::Provider::Package::Yum::YumCache.instance.reload }
  action :nothing
end

nodejs_repo_url = "https://rpm.nodesource.com/pub_10.x/el/#{node['platform_version'].to_i}/x86_64/nodesource-release-el#{node['platform_version'].to_i}-1.noarch.rpm"

remote_file "#{Chef::Config['file_cache_path']}/nodejs_repo.rpm" do
  source "#{nodejs_repo_url}"
  action :create
end

package "#{Chef::Config['file_cache_path']}/nodejs_repo.rpm" do
  action :install
  notifies :run, 'ruby_block[yum-cache-reload]', :immediately
end

package 'nodejs' do
  action :upgrade
end
