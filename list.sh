set -e

remote=${1?"need remote user@ip to install to"}
dbVersion=90

ssh $remote /opt/kwpc/list.sh $dbVersion
