dbVersion=${1?"need db version"}
b=`dirname $0`

sqlite3 ~/.kodi/userdata/Database/MyVideos$dbVersion.db < $b/$dbVersion.sql \
    | xargs -L 1 -I filename ls "filename" 2>/dev/null
exitCode=$?

# ignore error code 123 (some instances of ls failed, which is expected)
if [ $exitCode -ne 123 ] ; then
    exit $exitCode
fi
