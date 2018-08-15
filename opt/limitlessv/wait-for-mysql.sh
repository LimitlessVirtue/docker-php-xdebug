#!/usr/bin/env bash

set -e
set -x

host="$1"
shift
cmd="$@"

#if [[ -z "${MYSQL_USER}" ]]; then
#  MYSQL_USER=""
#fi
#
#if [[ -z "${MYSQL_PASSWORD}" ]]; then
#  MYSQL_PASSWORD=""
#fi
#
#if [[ -z "${MYSQL_DATABASE}" ]]; then
#  MYSQL_DATABASE=""
#fi


until mysql -h "$host" -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} -e 'select 1'; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "Mysql is up - executing command"
exec $cmd