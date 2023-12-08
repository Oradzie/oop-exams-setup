#!/bin/bash

function junit_setup() {

	PERCORSO=`find ~/ -name "junit-platform-console-standalone-1.9.1.jar" -print 2>/dev/null`;
	PERCORSO=${PERCORSO%%.jar*}.jar;
	
	[[ ! -d lib ]] && mkdir lib;
	[[ ! -e ./lib/${PERCORSO##*/} ]] && cp $PERCORSO ./lib

	[[ ! -d src ]] && mkdir src;
	[[ -d e1 ]] && mv e1 ./src;
	[[ -d e2 ]] && mv e2 ./src;
	
	cd src;

	cd e1;
	for file in `ls *.java`; do
		sed -i '' "1s/.*/package e1;/" $file
	done

	cd ../e2;
	for file in `ls *.java`; do
		sed -i '' "1s/.*/package e2;/" $file
	done

	cd ../..
	code .
}
