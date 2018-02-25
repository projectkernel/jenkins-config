terraform apply

# Provide inventory
export ANSIBLE_HOSTS=provision/inventories/ec2.py
export EC2_INI_PATH=provision/inventories/ec2.ini

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook provision/playbook.yml -u ubuntu