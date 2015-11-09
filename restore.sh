#! /bin/bash
source set-env.sh
mkdir -p $VAGRANT_HOME
cp -rf backup_data/boxes $VAGRANT_HOME/boxes
cp -rf backup_data/gems $VAGRANT_HOME/gems
