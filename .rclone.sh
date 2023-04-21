#!/bin/sh

##################
REMOTE_DIR="dropbox:/Lecture slides"
SYNC_DIR=`dirname -- $0`

cd "$SYNC_DIR"

# tell rclone to return error number 9 when nothing is copied
rclone sync --error-on-no-transfer "$REMOTE_DIR" "./" --exclude-from ".rcloneignore"
RET_VAL=$?

if [ $RET_VAL -eq 9 ]; then
    echo "nothing changed"
elif [ $RET_VAL -eq 0 ]; then
    echo "files copied succesfully!"
else
    echo "some other error!"
fi
