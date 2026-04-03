##ANI analysis (to be performed in a folder with subfolder (that contains assemblies to be analysed together)

#!/bin/bash
## Main directory where subfolders are located
main_dir="data/divided_by_species"
## Iterates through all subfolders in the root directory
for subdir in "$main_dir"/*/; do
    ## Makes sure at least one input file exists (you can change the extension as needed)
    if ls "$subdir"/*.fasta 1> /dev/null 2>&1; then
        ## Extract the subfolder name without the path
        folder_name=$(basename "$subdir")
       
        ## Create output subfolder with prefix ANI_
        output_dir="$subdir/ANI_$folder_name"
        mkdir -p "$output_dir"
       
        ## Run the ANIclustermap command with input from the subfolder and output in the ANI_ folder.
        ANIclustermap -i "$subdir" -o "$output_dir"
       
        echo "Run ANIclustermap for $folder_name"
    else
        echo "No input files found in $subdir, skipping this folder."
    fi 
done