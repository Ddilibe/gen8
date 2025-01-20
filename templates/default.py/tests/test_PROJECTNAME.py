import unittest

class DefaultTest(unittest.TestCase):
    """
    A simple test class to demonstrate basic unit testing.
    """

    def test_always_pass(self):
        """
        This test should always pass.
        """
        self.assertTrue(True)

    def test_always_fail(self):
        """
        This test should always fail.
        """
        self.assertFalse(False)
