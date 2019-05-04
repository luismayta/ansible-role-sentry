# -*- coding: utf-8 -*-
import os

import testinfra.utils.ansible_runner
from hamcrest import assert_that, equal_to

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE'],
).get_hosts('all')


def test_hosts_file(host):
    exe = host.file('/etc/hosts')
    assert_that(exe.exists, equal_to(True))
    assert_that(exe.user, equal_to('root'))
    assert_that(exe.goup, equal_to('root'))
