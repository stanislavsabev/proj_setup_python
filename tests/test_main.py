"""Test python_proj main."""

from python_proj import main


def test_main():
    """Test start.here."""
    expected = 'Hello world!'
    actual = main.main()
    assert actual == expected
