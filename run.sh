#!/bin/bash

# Initialize data directory
DATA_DIR=/data
#if [ ! -f $DATA_DIR/mysql ]; then
    #rm -rf /var/lib/mysql/*
    #mkdir -p /var/run/mysqld
    #chown mysql:mysql /var/run/mysqld
    #chown mysql:mysql /usr/sbin/mysqld
    #mkdir -p /data/mysql/data
    #chmod 777 -R /data/mysql
    #cd /data/mysql
    #mysqld --initialize-insecure --user=mysql --datadir=/data/mysql/data --basedir=/data/mysql
    # mysql_install_db
#fi
mysql_secure_installation

# Initialize first run
if [[ -e /.firstrun ]]; then
    /scripts/first_run.sh
fi

# Start MySQL
echo "Starting MySQL..."
chown mysql:mysql /usr/sbin/mysqld
/usr/sbin/mysqld
