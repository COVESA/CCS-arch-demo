#!/bin/sh

SQLITE=sqlite3
DBFILE=testbase.sqlite

# Start with a fresh file
rm -f "$DBFILE"

# Test script verifies that sqlite is installed and seems to work
$SQLITE $DBFILE 'CREATE TABLE ttable (col1 int, col2 string);'

# Insert some values
$SQLITE $DBFILE 'INSERT INTO ttable (col1, col2) VALUES ( 1, "one");'
$SQLITE $DBFILE 'INSERT INTO ttable (col1, col2) VALUES ( 2, "two");'
$SQLITE $DBFILE 'INSERT INTO ttable (col1, col2) VALUES ( 3, "three");'

# Get value
val=$( $SQLITE $DBFILE 'SELECT col2 FROM ttable WHERE col1 = 2' )

if [ "$val" != "two" ] ; then
  echo "SQLITE test failed:"
  echo "Got: $val"
  exit 1
else
  echo "Got expected value from database"
  echo "SQLITE test OK"
fi

