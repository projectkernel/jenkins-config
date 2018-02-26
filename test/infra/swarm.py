import pytest

def test_swarm(host):
    status = host.run("docker info | grep Swarm ").stdout
    assert status == "Swarm: active\n"