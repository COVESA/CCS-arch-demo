#!/bin/sh
echo
echo '--------------------------------------------------'
echo Starting local ovds-server
echo '--------------------------------------------------'
cp /data vsspathlist.
ovds/server/server /data/ovds.db /data/vss_gen2.cnative &
echo
echo '--------------------------------------------------'
echo 'Pause...'
echo '--------------------------------------------------'
sleep 10
echo
echo '--------------------------------------------------'
echo Starting livesim
echo '--------------------------------------------------'
cd livesim # Must cd, because program expects vsspathlist.json in current directory
./livesim VIN001 localhost /data/statestorage.db
echo DONE

