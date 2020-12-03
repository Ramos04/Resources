#!/bin/bash 

output="# Resources\n\nFull of resources i've gathered over the years\n\n## Table of Contents\n\n"
echo -e $output


#- [Active Directory](#active-directory)
#  - [Kill Chain](#kill-chain)

# initial loop
for dir in $(ls ./); do

     # check if its a directory
     if [[ -d $dir ]]; then
          echo "- [$dir](#./$dir)"

          for file in $(ls "./$dir"); do
               file_path="./$dir/$file"
               file_toc=$(awk '/begin/,/end/' $file_path)
               echo $file_toc

               temp="${file%.*}"
               temp2="${temp//_/ }"
               file_name=$(echo -e "$temp2" | sed -e "s/\b\(.\)/\u\1/g")

               if [[ -f $file_path ]]; then
                    echo "  - [$file_name](#$file_path)"
               fi
          done
     fi
done
