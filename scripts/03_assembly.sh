#!/bin/bash

## Specifies the directory containing the FASTQ files
indir="data/clean"
outdir="results/assembly"
logdir="logs"

## Create the log directory if it doesn't exist
mkdir -p "$logdir"
mkdir -p "$outdir"

## For each file ending with _1.fastq.gz in the specified directory
for R1 in "$indir"/*_1.fastq.gz; do
    ## Replaces _1.fastq.gz con _2.fastq.gz to find the matching file
    R2="${R1/_1.fastq.gz/_2.fastq.gz}"

    ## Extract the common part of the file name (without _1.fastq.gz)
    sample=$(basename "$R1" _1.fastq.gz)

    ## Create an output directory for this sample
    sample_outdir="$outdir/$sample"

    ## Defines the log file for this sample using only the common part
    logfile="$logdir/${sample}_shovill.log"

    ## Run the shovill command and redirect the output and standard error to the log file.
    echo "Processing sample $sample..." | tee -a "$logfile"
    shovill --cpus 80 --minlen 200 --outdir "$sample_outdir" --R1 "$R1" --R2 "$R2" >> "$logfile" 2>&1

    ## Check if the command was successful
    if [ $? -eq 0 ]; then
        echo "Sample $sample processed successfully." | tee -a "$logfile"
    else
        echo "Error processing sample $sample. Check the log file for details." | tee -a "$logfile"
    fi

    echo "------------------------------------------------------------" | tee -a "$logfile"
done