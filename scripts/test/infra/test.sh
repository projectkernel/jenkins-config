vagrant ssh-config > .vagrant/ssh-config
py.test --sudo --hosts=default --ssh-config=.vagrant/ssh-config test/infra/*