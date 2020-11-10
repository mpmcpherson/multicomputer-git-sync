#!/bin/bash
workingDir=/home/michaelmcpherson/src;
runDir=$(pwd);

while read line;
do
	if [ $line != 'notMine' ]; then
		cd "$workingDir/$line";
		#echo $(pwd);

		outVar=$(git config --get remote.origin.url);

		#printf "outvar = %s\n" "$outVar";
		#ls $workingDir > 'gitScan2.config';
		
		printf "%s\n" "$outVar" >> "$workingDir/gitRecurse/gitPull.config";
		
		#printf "\n" >> "gitPull.config";

		cd $runDir;

	fi
done < gitScan2.config