applicationType = Chef::Config[:node_name][0,1]

case applicationType
when "p"
  installRPMFileName = "#{node['prd']['VPC']['S3FileName']}"
when "s"
  installRPMFileName = "#{node['stg']['VPC']['S3FileName']}"
end

# Install some stuff.
["apache2"].each do |pkg|
  package pkg do
    action :install
  end
end

# Replace apache2.conf file.
template "/etc/apache2/apache2.conf" do
  source "apache2.conf"
  print "config apache2"
end

# Replace index.html file.

template "/var/www/html/index.html" do
  source "#{installRPMFileName}"
end