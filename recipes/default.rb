#
# Cookbook Name:: learn_chef_httpd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package 'httpd'

# Install, enable and start service
service 'httpd' do
  action [:enable, :start]
end

# Add web_admin group
group 'web_admin'

# Add web_admin user
user 'web_admin' do
  group 'web_admin'
  system true
  shell '/bin/bash'
end

# Write out httpd config file in correct location 
template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0644'
  owner 'web_admin'
  group 'web_admin'
end
