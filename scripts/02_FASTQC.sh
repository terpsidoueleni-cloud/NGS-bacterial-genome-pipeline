##fast quality control

#!/bin/bash


## Specifies the directory containing the FASTQ files
CLEAN_DIR="data/clean"
LOG_DIR="logs/fastqc"



## Create the log directory if it doesn't exist
mkdir -p "$LOG_DIR"

## For each file ending with _1.fastq.gz in the specified directory
for R1 in "$CLEAN_DIR"/*_1.fastq.gz; do
    ## Replace _1.fastq.gz with _2.fastq.gz to find the matching file
    R2="${R1/_1.fastq.gz/_2.fastq.gz}"

    ##Extract the common part of the file name (without _1.fastq.gz)
    sample=$(basename "$R1" _1.fastq.gz)

    ## Defines the log file for this sample
    logfile="$LOG_DIR/${sample}_fastqc.log"

    ## Run the fastqc command and redirect the output and standard error to the log file.
    echo "Running FastQC for sample $sample..." | tee -a "$logfile"
    fastqc -t 80 -f fastq "$R1" "$R2" >> "$logfile" 2>&1

    ## Check if the command was saccessful
    if [ $? -eq 0 ]; then
        echo "FastQC for sample $sample completed successfully." | tee -a "$logfile"
    else
        echo "Error during FastQC for sample $sample. Check the log file for details." | tee -a "$logfile"
    fi

    echo "------------------------------------------------------------" | tee -a "$logfile"
done
