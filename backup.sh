#! /bin/bash
source set-env.sh
mkdir -p data
cp -rf $VAGRANT_HOME/boxes backup_data/boxes
cp -rf $VAGRANT_HOME/gems backup_data/gems
