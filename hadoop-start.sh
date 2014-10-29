#!/bin/bash
# Script to start Hadoop services automatically.

echo "The script to start Hadoop is now starting..."
# Make sure the use has ssh'ed to localhost
while true; do
    read -p "Have you ssh'ed into localhost by 'ssh localhost'?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

/usr/local/Cellar/hadoop/2.5.1/libexec/bin/hdfs namenode -format
/usr/local/Cellar/hadoop/2.5.1/libexec/sbin/start-dfs.sh
/usr/local/Cellar/hadoop/2.5.1/libexec/sbin/start-yarn.sh


echo "Hadoop services dfs and yarn has been started. The script is complete."
