##Reads trimming

#!/bin/bash

## Specify the path of the folder containing the files
directory=$(pwd)

## Log files
log_file="adapter_removal.log"

## Create or clear the log file
> "$log_file"

## List all files ending with _1.fq.gz in the folder
files_1=("$directory"/*_1.fq.gz)

## Using loop on file _1
for file_1 in "${files_1[@]}"
do
    ## Remove the "_1.fq.gz" suffix from the file name
    file_base=${file_1%_1.fq.gz}

    ## Construct the file name _2 by replacing "_1" with "_2"
    file_2="${file_base}_2.fq.gz"

    ## Check if the file _2 exists
    if [[ -f "$file_2" ]]; then
        echo "Processing: $file_1 e $file_2" | tee -a "$log_file"
       
        ## Run AdapterRemoval
        AdapterRemoval --file1 "$file_1" --file2 "$file_2" \
            --output1 "${file_base}_cleaned_1.fastq.gz" \
            --output2 "${file_base}_cleaned_2.fastq.gz" \
            --threads 80 --gzip --minlength 50 \
            --trimqualities --minquality 30 --trimns --maxns 10 \
            --trim5p 2 --trim3p 2 | tee -a "$log_file"

        if [[ $? -eq 0 ]]; then
            echo "Successfully completed: $file_1 e $file_2" | tee -a "$log_file"
        else
            echo "Error processing: $file_1 e $file_2" | tee -a "$log_file"
      fi

    else
        echo "Missing file: $file_2 for $file_1" | tee -a "$log_file"
 fi
done

echo "Operation completed. Check $log_file for details."