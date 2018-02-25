import pytest

def test_swarm(host):
    desired_state = "Swarm: active"
    status = host.run("docker info | grep '" + desired_state + "'")
    assert status == desired_state