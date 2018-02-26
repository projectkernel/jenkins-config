import pytest

@pytest.mark.parametrize("name", [
    ("/home/docker-compose.yml"),
    ("/etc/docker/daemon.json")
])
def test_compose_file(host, name):
    compose = host.file(name)
    assert compose.exists