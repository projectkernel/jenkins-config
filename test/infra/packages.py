import pytest

@pytest.mark.parametrize("name, version", [
    ("nginx", "1.6"),
    ("python", "2.7"),
])
def test_packages(host, name, version):
    pkg = host.package(name)
    assert pkg.is_installed
    assert pkg.version.startswith(version)