#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev

DATE=`date +%Y%m%d-%X`
## keep file only last KEEP_DAYS
KEEP_DAYS=30

BACKUP_DEST_DIR="~/.backup"
BACKUP_FILENAME="${BACKUP_DEST_DIR}/${DATE}.tar.gz"

## mysql
#MYSQL_DUMP_FILE="~/.backup/mysqldump.sql'
#MYSQL_DUMP_ARGS="--all-databases"
## by default root have access to mysql without password and connecting to
# unix socket, by if it is no true, use this parameters
#MYSQL_HOST=""
#MYSQL_PORT=""
#MYSQL_USER=""
#MYSQL_PASSWORD=""

TAR_ARGS="-z"
BACKUP_FILES="/usr/local/ \
/etc/crontab \
/etc/nginx/nginx.conf \
/etc/vsftpd.conf \
/etc/my.cnf \
/etc/ntp.cnf \
/etc/dnsmasq.conf \
/etc/dnsmasq.host.conf \
/etc/openvpn/ \
/etc/sysconfig/network/config \
/etc/sysconfig/network/ifcfg-eth0 \
/etc/sysconfig/network/ifcfg-eth1 \
/etc/sysconfig/SuSEfirewall2 \
/etc/sysconfig/SuSEfirewall2.d/
"
# $MYSQL_DUMP_FILE
EXCLUDE_PATTERN=

## create backup destination dir
mkdir -p "$BACKUP_DEST_DIR"

## set parameters for mysqldump
# [[ -z "$MYSQL_HOST" ]] 		|| MYSQL_DUMP_ARGS=${MYSQL_DUMP_ARGS} -h "$MYSQL_HOST"
# [[ -z "$MYSQL_PORT" ]] 		|| MYSQL_DUMP_ARGS=${MYSQL_DUMP_ARGS} -P "$MYSQL_PORT"
# [[ -z "$MYSQL_USER" ]] 		|| MYSQL_DUMP_ARGS=${MYSQL_DUMP_ARGS} -u "$MYSQL_USER"
# [[ -z "$MYSQL_PASSWORD" ]]  || MYSQL_DUMP_ARGS=${MYSQL_DUMP_ARGS} -p "$MYSQL_PASSWORD"
# create MySQL dump
# mysqldump $MYSQL_DUMP_ARGS > $MYSQL_DUMP_FILE 2>/dev/null

## archive files
# set parameters for tar
[[ -z $EXCLUDE_PATTERN ]] || TAR_ARGS=${TAR_ARGS} --exclude=${EXCLUDE_PATTERN}
tar -cf $BACKUP_FILENAME ${TAR_ARGS} $BACKUP_FILES 2>/dev/null

## delete old backup archives
#
find "$BACKUP_DEST_DIR" -mtime +${KEEP_DAYS} -delete

exit 0
