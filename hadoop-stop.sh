#!/bin/bash

echo "The script will stop the following Hadoop servcies: DFS, YARN (and all). It starts now."
echo

/usr/local/Cellar/hadoop/2.5.1/sbin/stop-dfs.sh
/usr/local/Cellar/hadoop/2.5.1/sbin/stop-yarn.sh
/usr/local/Cellar/hadoop/2.5.1/sbin/stop-all.sh
/usr/local/Cellar/hbase/hbase-0.98.6.1-hadoop2/bin/stop-hbase.sh

echo "The script ends."
