################# SETUP ####################
vagrant up --provision

############# ACT ########################
vagrant ssh-config > .vagrant/ssh-config
testinfra --hosts=default --ssh-config=.vagrant/ssh-config test/infra

################# TEARDOWN ##################
vagrant destroy -f

