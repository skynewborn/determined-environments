#!/bin/sh
set -e
#cp /etc/hosts ~/hosts.new
#sed -i "/# GitHub520 Host Start/Q" ~/hosts.new
curl https://raw.hellogithub.com/hosts >> /etc/hosts
#cp -f ~/hosts.new /etc/hosts
#cat ~/hosts.new > /etc/hosts