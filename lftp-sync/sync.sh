#!/bin/sh

# Firest sync
lftp -u $FTP_USER,$FTP_PASS ftp://$FTP_HOST <<EOF
  set ftp:charset UTF-8
  set ssl:verify-certificate false
  mirror --reverse --delete --verbose --no-perms /sync-folder $REMOTE_FOLDER
  bye
EOF

# Then sync on changes
inotifywait -m -r -e create,modify,delete /sync-folder | while read path action file; do
  lftp -u $FTP_USER,$FTP_PASS ftp://$FTP_HOST <<EOF
    set ftp:charset UTF-8
    set ssl:verify-certificate false
    mirror --reverse --delete --verbose --no-perms /sync-folder $REMOTE_FOLDER
    bye
EOF
done
