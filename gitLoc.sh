#!/bin/bash
workingDir=/home/michael/src;
runDir=$(pwd);

cd "$workingDir";
lsVal=$(ls -d */);
cd $runDir;

for line in $lsVal; do
	if [ $line != 'notMine' ];
	then
		cd "$workingDir/$line";
		if [ $(ls -d .git)=='.git' ];
		then
			git add -A;
			git commit -m "autocommit $(date)";
			git push;
		fi
		cd $runDir;
	fi
done
