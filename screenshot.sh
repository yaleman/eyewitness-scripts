#!/bin/bash

DATEFLAG=$(date '+%Y-%m-%d-%H%M%S')
DIRECTORY="data/$DATEFLAG"
mkdir $DIRECTORY 

TESTURL=$(./testurl.py $1)

if [ $TESTURL -eq 1 ]
then

	docker run \
	    --rm \
	    -it \
	    -v $(pwd)/$DIRECTORY:/tmp/EyeWitness \
	    eyewitness \
	    --web \
	    --single $1

	firefox "$DIRECTORY/results/report.html"
else
	echo "Testurl failed"
fi
