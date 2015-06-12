b=`dirname $0`
cmd=${1?"need command as first parameter"}

"$b/$cmd.sh" "${@:2}"
