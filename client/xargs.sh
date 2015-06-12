set -e

b=`dirname $0`
dbVersion=${1?"need db version"}
cmd=${2?"command for xargs"}

"$b/list.sh" $dbVersion \
    | xargs -L 1 -I filename $cmd ${@:3}
