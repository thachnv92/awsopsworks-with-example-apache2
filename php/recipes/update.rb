# Run an update on the box.
execute "apt-get-update" do
  command "apt-get update"
end

# Run an update on the box.
#execute "apt-get install default-jre -y" do
#  command "apt-get install default-jre -y"
#end