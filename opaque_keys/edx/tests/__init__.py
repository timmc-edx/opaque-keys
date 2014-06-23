"""
Utilities for other Location tests to use
"""
from unittest import TestCase


class LocatorBaseTest(TestCase):
    """
    Utilities used in other Location tests
    """
    # ------------------------------------------------------------------
    # Utilities

    def check_course_locn_fields(self, testobj, version_guid=None,
                                 org=None, course=None, run=None, branch=None):
        """
        Checks the version, org, course, run, and branch in testobj
        """
        self.assertEqual(testobj.version_guid, version_guid)
        self.assertEqual(testobj.org, org)
        self.assertEqual(testobj.course, course)
        self.assertEqual(testobj.run, run)
        self.assertEqual(testobj.branch, branch)

    def check_block_locn_fields(self, testobj, version_guid=None,
                                org=None, course=None, run=None, branch=None, block_type=None, block=None):
        """
        Does adds a block id check over and above the check_course_locn_fields tests
        """
        self.check_course_locn_fields(testobj, version_guid, org, course, run,
                                      branch)
        if block_type is not None:
            self.assertEqual(testobj.block_type, block_type)
        self.assertEqual(testobj.block_id, block)