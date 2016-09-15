#!/bin/bash

LOCUST_CMD="/usr/local/bin/locust"
LOCUST_OPTS="-f $SCENARIO_FILE --host=$TARGET_URL"

# locust -f locust_file.py WebUserLocust MobileUserLocust
# That's how you specify multiple User types.
if [ "$LOCUST_CLASSES" ]; then
    LOCUST_OPTS="$LOCUST_OPTS $LOCUST_CLASSES"
fi

LOCUST_MODE=${LOCUST_MODE:-standalone}

if [ "$LOCUST_MODE" = "master" ]; then
  LOCUST_OPTS="$LOCUST_OPTS --master"
elif [ "$LOCUST_MODE" = "slave" ]; then
  LOCUST_OPTS="$LOCUST_OPTS --slave --master-host=$MASTER_HOST"
fi

echo "=> Starting locust"
echo "$LOCUST_CMD $LOCUST_OPTS"

$LOCUST_CMD $LOCUST_OPTS
