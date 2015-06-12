set -e

cmd=${1?"Need command as first argument"}

dbVersion=90

usage() {
    echo "$1" 1>&2
    echo -e "Required params\n" \
        "\t-r user@server" \
        1>&2
    echo -e "Optional params [default value]\n" \
        "\t-d dbVersion [90]" \
        1>&2
    exit 1;
}
paramCheck() {
    if [ -z $1 ] ; then
        usage "missing: $2"
    fi
}

OPTIND=$((OPTIND+1))
while getopts "d:r:x:X:" o; do
    case "${o}" in
        d)
            dbVersion=${OPTARG}
            ;;
        r)
            remote=${OPTARG}
            ;;
        x)
            xargCommand=${OPTARG}
            ;;
        X)
            xargArgs=${OPTARG}
            ;;
        *)
            usage "invalid param"
            ;;
    esac
done

paramCheck "$remote" "-r user@remote";

if [ $cmd == "install" ] ; then
    d=`dirname $0`
    $d/install-client-ssh.sh $remote
elif [ $cmd == "list" ] ; then
    ssh $remote /opt/kwpc/client.sh $cmd $dbVersion
elif [ $cmd == "xargs" ] ; then
    paramCheck "$xargCommand" "-x xargCommand"
    paramCheck "$xargArgs" "-X xargArgs"
    ssh $remote /opt/kwpc/client.sh $cmd $dbVersion $xargCommand $xargArgs
else
    echo "unknown command $cmd" 1>&2
    exit 1
fi
