##Markdown

# Bacterial Genome Analysis Pipeline

This repository contains a reproducible bioinformatics pipeline for bacterial genome analysis developed based on workflows used during a bioinformatics internship.

The pipeline demonstrates practical experience with Linux, Bash scripting, NGS data processing and reproducible workflow design.

---

## Overview

The pipeline performs end-to-end processing of paired-end Illumina reads:

1. Read trimming and filtering
2. Quality control
3. Genome assembly
4. ANI analysis
5. Genome annotation

The goal is to provide a modular and reproducible workflow that can be executed with a single command.

---

## Tools used

- AdapterRemoval – read trimming
- FastQC – quality control
- Shovill – genome assembly
- ANIclustermap – ANI analysis
- Tormes – genome annotation

---

## Project Structure

NGS-bacterial-genome-pipeline
│
├── scripts/
├── data/
│ ├── raw/
│ └── clean/
├── results/
├── logs/
├── README.md
└── WORKFLOW.md


---

## Requirements

Linux environment

Installed tools:
- AdapterRemoval
- FastQC
- Shovill
- ANIclustermap
- Tormes

---

## How to run the pipeline

Clone the repository:
git clone https://github.com/yourusername/NGS-bacterial-genome-pipeline.git

cd NGS-bacterial-genome-pipeline


Place paired-end FASTQ files in:
data/raw/


Run the full pipeline:
bash scripts/run_pipeline.sh


---

## Purpose of this repository

This project showcases:
- Bash scripting
- Pipeline design
- Reproducible workflows
- NGS data analysis
- Bioinformatics tooling


