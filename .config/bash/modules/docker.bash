#!/usr/local/bin/bash

function docker-interface {
    ip l | grep $(docker exec $@ cat /sys/class/net/eth0/iflink) | awk '{print $2}' | awk -F@ '{print $1}'
}
