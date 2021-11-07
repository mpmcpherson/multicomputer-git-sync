#!/bin/bash

#move to src folder; assume that src is right off home
workingDir=~/src;
runDir=$(pwd);
gitList=$( cat gitrecurse/projectlist.config );

#sync non-local projects to this machine
for entry in $gitList; do
	git clone $entry;
done


#update/push existing projects
cd "$workingDir";
lsVal=$(ls -d */);
cd $runDir;
for line in $lsVal; do
	if [ $line != 'notMine' ];
	then
		cd "$workingDir/$line"; 
		pwd;
		printf '\n';
		if [ -e '.git' ];
		then
		    git fetch;
		    git pull;
		    git add -A;
		    git commit -m "autocommit $(date)";
		    git push;

		    #this...might append this info to the config file. Might blow up.
		    gitConf="gitrecurse/projectlist.config"
			gitURL=$(git config --get remote.origin.url);
			if [ ! $( grep $gitURL $runDir/$gitConf ) ];
			then
				printf $gitURL >> $runDir/$gitConf;
				printf '\n' >> $runDir/$gitConf;
			fi

		fi
		cd $runDir;
		printf '\n';
	fi
done


#grep -qxF 'include "/configs/projectname.conf"' foo.bar || echo 'include "/configs/projectname.conf"' >> foo.bar

#git config --get remote.origin.url
