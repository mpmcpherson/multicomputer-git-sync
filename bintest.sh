#!/bin/bash
workingDir=/home/michaelmcpherson/src;
targets=`ls $workingDir`;

for fn in "$targets"; 
do cat "$fn"; done

#Basically archival of public repos in a way that checks vs local diffs from prior runs such that even if a git history is altered every change the puller sees is arrived, so if a pull has x new conmits they're all preserved, and if someone hacks the history that's preserved as a separate commit