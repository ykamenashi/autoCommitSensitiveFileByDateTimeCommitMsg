#!/usr/bin/env bash
CONFIG_FILE_PATH="./CONFIG"
if [ -f "$CONFIG_FILE_PATH" ] ; then
  source "$CONFIG_FILE_PATH"
else
  echo "No config file supplied. quit. : $CONFIG_FILE_PATH"
  exit 255
fi

echo "copy & add automatically: $AUTO_ADD"
echo "commit & msg automatically: $AUTO_COMMIT"
echo "commit message: $COMMIT_MSG"
echo "DB filename: $DBFILENAME"
echo "commit branch: $BRANCH_NAME"
echo cp "$FROM_DIR" "$TO_DIR"
echo ""
echo "is This OKAY to COPY? (Y or ^C)"
echo -n '> '
read ANS
if [[ "$ANS" != "Y" ]] ; then
  echo "Unexpected Answer. quit."
  exit 254
fi

git checkout "$BRANCH_NAME" \
&& cp "$FROM_DIR" "$TO_DIR" \
&& git add "$DBFILENAME" \
&& git status \
&& git commit -m "$COMMIT_MSG"
