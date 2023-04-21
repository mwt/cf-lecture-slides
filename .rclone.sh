#!/bin/sh

##################
REMOTE_DIR="dropbox:/Lecture slides"
SYNC_DIR=`dirname -- $0`

# Change to the directory where the script is located
cd "$SYNC_DIR"

# Checkout the dropbox branch
git checkout dropbox && git pull

# tell rclone to return error number 9 when nothing is copied
rclone sync --error-on-no-transfer "$REMOTE_DIR" "./" --exclude-from ".rcloneignore"
RET_VAL=$?

if [ $RET_VAL -eq 9 ]; then
    echo $(date +'[%D %T]') "nothing changed"
elif [ $RET_VAL -eq 0 ]; then
    echo $(date +'[%D %T]') "files copied succesfully!"
    git add -A
    git commit -c "user.name=Craig Furfine" -c "user.email=c-furfine@kellogg.northwestern.edu" -m "Automatic update from dropbox"
    git push
else
    echo $(date +'[%D %T]') "some other error!"
fi
