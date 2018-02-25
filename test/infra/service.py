import pytest

def test_app_socket_is_listening(host):
    assert host.socket("tcp://0.0.0.0:8080").is_listening