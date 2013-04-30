#!/bin/bash

CACHE=`echo 'get views//index' | nc 127.0.0.1 11211`
if [ ${#CACHE} -eq 4 ]; then
  wget -O- --header 'Host: puppet-dashboard.ec2.pinadmin.com' http://127.0.0.1:8000/ > /dev/null
fi

CACHE=`echo 'get views//nodes' | nc 127.0.0.1 11211`
if [ ${#CACHE} -eq 4 ]; then
  wget -O- --header 'Host: puppet-dashboard.ec2.pinadmin.com' http://127.0.0.1:8000/nodes > /dev/null
fi

CACHE=`echo 'get views//reports' | nc 127.0.0.1 11211`
if [ ${#CACHE} -eq 4 ]; then
  wget -O- --header 'Host: puppet-dashboard.ec2.pinadmin.com' http://127.0.0.1:8000/reports > /dev/null
fi
