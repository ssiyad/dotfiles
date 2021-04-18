DIR="/tmp/clipboard"
[ -d $DIR ] || mkdir $DIR
FILENAME="$DIR/$(date +%s)"
echo $FILENAME
wl-paste > $FILENAME
