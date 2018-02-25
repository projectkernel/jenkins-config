# Allows this host to SSH terraform created machines
PUB_KEY=$(cat ~/.ssh/id_rsa.pub)
terraform apply \
    -var "host_pub_key=$PUB_KEY"

# Locate Machines
export ANSIBLE_HOSTS=provision/inventories/ec2.py
export EC2_INI_PATH=provision/inventories/ec2.ini

ansible -m ping tag_Name_jenkins