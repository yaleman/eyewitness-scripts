#!/bin/bash

DATEFLAG=$(date '+%Y-%m-%d-%H%M%S')

mkdir data/$DATEFLAG

TESTURL=$(./testurl.py $1)

if [ $TESTURL -eq 1 ]
then

	docker run \
	    --rm \
	    -it \
	    -v ~/Projects/eyewitness/data/$DATEFLAG:/tmp/EyeWitness \
	    eyewitness \
	    --web \
	    --single $1

	firefox data/$DATEFLAG/results/report.html
else
	echo "Testurl failed"
fi
