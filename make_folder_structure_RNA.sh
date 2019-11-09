#!/bin/bash

################
# Make Folders #
################

#######################
# Handle Command Line #
#######################
rawdataPath=$1
folderPath=$2
if [[ "$1" == "" || "$2" == "" ]]
then
	echo "Usage: $0 <fastq_raw_data_folder > <path_to_create_folders>"
	exit 1
fi

# Loop through each .fastq file in the rawdata path
for fastq_file_path in `ls $rawdataPath/*.fastq`
do	
	fastq_file=`basename $fastq_file_path`
	plant=`echo $fastq_file | cut -d '_' -f 1 | cut -d '-' -f 1`
	#echo $plant
	tissue=`echo $fastq_file | cut -d '_' -f 1 | cut -d '-' -f 2`
	#echo $tissue
	treatment=`echo $fastq_file | cut -d '_' -f 1 | cut -d '-' -f 3`
	#echo $treatment
	timepoint=`echo $fastq_file | cut -d '_' -f 1 | cut -d '-' -f 4`
	#echo $timepoint
	replicate=`echo $fastq_file | cut -d '_' -f 1 | cut -d '-' -f 5`
	#echo $replicate
	dateN=`echo $fastq_file | cut -d '-' -f 6`
	#echo $dateN
	barcode=`echo $fastq_file | cut -d '-' -f 7 | cut -d '_' -f 1`
	#echo $barcode
	samplenumberspecific=`echo $fastq_file | cut -d '-' -f 7 | cut -d '_' -f 2`
	#figure out later
	#echo $samplenum
	#samplenum= `$dateN$barcode $samplenumberspecific`
	#echo $samplenum

	mkdir -p "${folderPath}/${plant}/${tissue}/${treatment}/${timepoint}/${replicate}/${dateN}/${barcode}/${samplenumberspecific}" >/dev/null 2>&1
done