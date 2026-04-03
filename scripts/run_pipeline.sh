#!/bin/bash

echo "Step 1: Trimming reads"
bash scripts/01_trimming.sh

echo "Step 2: FastQC"
bash scripts/02_fastqc.sh

echo "Step 3: Assembly"
bash scripts/03_assembly.sh

echo "Step 4: ANI analysis"
bash scripts/04_ani.sh

echo "Step 5: Annotation"
bash scripts/05_tormes.sh

echo "Pipeline completed!"