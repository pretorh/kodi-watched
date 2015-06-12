set -e

cmd=${1?"Need command as first argument"}

dbVersion=90

usage() {
    echo "need $1" 1>&2
    exit 1;
}

OPTIND=$((OPTIND+1))
while getopts "d:r:" o; do
    case "${o}" in
        d)
            dbVersion=${OPTARG}
            ;;
        r)
            remote=${OPTARG}
            ;;
        *)
            echo "unknown parameter" 2>&1
            exit 1
            ;;
    esac
done

[ -z $remote ] && usage "-r user@remote"

if [ $cmd == "list" ] ; then
    ssh $remote /opt/kwpc/client.sh $cmd $dbVersion
else
    echo "unknown command $cmd" 1>&2
    exit 1
fi
