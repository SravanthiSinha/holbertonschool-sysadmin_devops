#!/usr/bin/python3
"""
Deploy fast, deploy well
"""

from fabric.api import *


def pack():
    local("tar -cvzf holbertonwebapp.tar.gz ./*")


def deploy():
    with settings(user="ubuntu"):
        upload = put("holbertonwebapp.tar.gz", "/tmp/holbertonwebapp.tar.gz")


def clean():
    local("rm -rf holbertonwebapp.tar.gz")
