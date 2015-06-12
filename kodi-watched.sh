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
            usage "invalid param"
            ;;
    esac
done

[ -z $remote ] && usage "missing: -r user@remote"

if [ $cmd == "list" ] ; then
    ssh $remote /opt/kwpc/client.sh $cmd $dbVersion
else
    echo "unknown command $cmd" 1>&2
    exit 1
fi
