#!/bin/bash

# A script to provide summary information about multiple FASTA files
# Chelsea Noack
# cnoackj@gmail.com
# Last Modified: September 15th, 2017

# First, the files will be individually unzipped by using a for loop
echo "   "
echo "Unzipping files..."
cd data
unzip \*.zip
cd ../
echo "Files unzipped!"
echo "-------"
echo "  "

# Second, the following lines will echo the date and what the preceding output will generate. The date will be generated dynamically.
echo "This is a log file for selected fasta files"
date "+DATE: %y-%m-%d"
echo "  "
echo "Output for each fasta includes:
Filename, file size, first three lines, last three lines, the number of sequences in the file, and the sequence identifier lines, sorted alphabetically."
echo "-------"
echo "   "

# Third, the following lines will output summaries of the fasta files. 

cd data
for file in $@
do 
	echo "########"
	echo "Output for $file:" 
	echo "     "
	echo "Size:"
	du -sh $file
	echo "     "
	echo "First three lines:"
	head -3 $file
	echo "     "
	echo "Last three lines:"
	tail -3 $file
	echo "     "
	echo "Number of sequences: $(grep -e '>' $file | sort -g)"
	
done
