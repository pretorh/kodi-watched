set -e

remote=${1?"need remote user@ip to install to"}
destination=/opt/kwpc/

ssh $remote "mkdir -p /tmp/kwpc"
scp client/* $remote:/tmp/kwpc
ssh $remote "sudo rm -rf $destination ; sudo mv /tmp/kwpc $destination"
