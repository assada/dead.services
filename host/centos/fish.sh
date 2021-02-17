#!/bin/bash

cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:fish:release:3/CentOS_8/shells:fish:release:3.repo
yum install fish
