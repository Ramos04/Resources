#!/bin/bash 

# header for the README
readme="./README.md"
output="# Resources\n\nFull of resources i've gathered over the years\n\n## Table of Contents\n"
echo -e $output > $readme

# initial loop
for dir in $(ls ./); do

     # check if its a directory
     if [[ -d $dir ]]; then
          echo "- [$dir](#./$dir)" >> $readme

          # for file in each directory
          for file in $(ls "./$dir"); do

               # full path to the file
               file_path="./$dir/$file" 

               # get the table of contents from the file
               #file_toc=$(sed -n '/begin/,/end/p' $(echo $file_path))
               
               # table of contents name of file
               toc_entry="$(echo $file | cut -d'.' -f1 | sed 's/_/ /g')"

               if [[ -f $file_path ]]; then
                    echo "  - [$toc_entry](#$file_path)" >> $readme
               fi
          done
     fi
done
