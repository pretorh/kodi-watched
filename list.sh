set -e

dbVersion=90

usage() {
    echo "-r user@remote [-d dbVersion]" 1>&2
    exit 1;
}

while getopts "d:r:" o; do
    case "${o}" in
        d)
            dbVersion=${OPTARG}
            ;;
        r)
            remote=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

[ -z $remote ] && echo "Need user@remote to connect to (-r)" 1>&2 && usage

ssh $remote /opt/kwpc/list.sh $dbVersion
