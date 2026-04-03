# Bacterial Genome Analysis Pipeline

## Overview
Pipeline for bacterial genome assembly and downstream analysis.

## Steps

### 1. Reads trimming
Tool: AdapterRemoval
Input: paired-end FASTQ files
Output: cleaned FASTQ files

### 2. Quality control
Tool: FastQC
Input: cleaned FASTQ
Output: quality reports

### 3. Genome assembly
Tool: Shovill
Input: cleaned reads
Output: assembled genomes

### 4. ANI analysis
Tool: ANIclustermap
Input: assemblies grouped by species
Output: ANI similarity matrices

### 5. Genome annotation
Tool: Tormes
Input: assemblies + metadata
Output: annotated genomes