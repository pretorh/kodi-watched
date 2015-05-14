set -e

dbVersion=${1?"need db version"}
b=`dirname $0`

sqlite3 ~/.kodi/userdata/Database/MyVideos$dbVersion.db < $b/$dbVersion.sql \
    | xargs -L 1 -I filename ls "filename" 2>/dev/null
