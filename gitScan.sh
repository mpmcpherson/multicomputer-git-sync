#!/bin/bash
workingDir=/home/michaelmcpherson/src; #fix this so it gets the immediate parent
#ls $workingDir > 'gitScan2.config';
runDir=$(pwd);
echo -n "get, push, or clone? (case and spelling matter): ";
read;


if [ ${REPLY} == "get" ]
then
	printf "lol we're not there yet \n";
fi


if [ ${REPLY} == "push" ]
then
	while read line;
	do
		if [ $line != 'notMine' ];
		then
			cd "$workingDir/$line";
			echo $(pwd);
			git add .;
			git commit -m "gitScan push";
			git push;
			#git config --get remote.origin.url
			#possible password solution
			#git pull "https://michael@mpmcpherson.com:Adein1Dva2!@github.com/mpmcpherson/<repository_name>.git" <master>
			#git log;
			cd $runDir;
			#echo $line
		fi
	done < gitScan2.config
fi

if [ ${REPLY} == "clone" ]
then
	while read line;
	do
		if [ $line != 'notMine' ]
		then
			mkdir $line;

			cd "$workingDir/$line";
			echo $(pwd);

			git clone $

			#git config --get remote.origin.url
			#possible password solution
			#git log;
			cd $runDir;
			#echo $line
		fi
	done < gitScan2.config
fi

#Basically archival of public repos in a way that checks vs local diffs from prior runs such that even if a git history is altered every change the puller sees is arrived, so if a pull has x new conmits they're all preserved, and if someone hacks the history that's preserved as a separate commit
