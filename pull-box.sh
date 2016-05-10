#!/bin/bash
vagrant box add $1
vagrant mutate $1 --input-provider=virtualbox libvirt
