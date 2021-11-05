#!/bin/bash

workingDir=~/src;
runDir=$(pwd);

cd "$workingDir";
lsVal=$(ls -d */);
cd $runDir;

for line in $lsVal; do
	if [ $line != 'notMine' ];
	then
		cd "$workingDir/$line";
		pwd;
		if [ -e '.git' ];
		then
		    git fetch;
		    git pull;
		    git add -A;
		    git commit -m "autocommit $(date)";
		    git push;
		fi
		cd $runDir;
	fi
done

#grep -qxF 'include "/configs/projectname.conf"' foo.bar || echo 'include "/configs/projectname.conf"' >> foo.bar

#git config --get remote.origin.url
