b=`dirname $0`
cmd=${1?"need command as first parameter"}

if [ -f "$b/$cmd.sh" ] ; then
    ext=sh
else
    echo "unknown command (no file matching $cmd)" 2>&1
    exit 1
fi

"$b/$cmd.$ext" "${@:2}"
