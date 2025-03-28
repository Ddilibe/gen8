#!/bin/bash

script_dir="$(dirname "$(readlink -f "$0")")"
template_dir="${script_dir}/templates"

usage() {
  >&2 echo "Usage: $0 <project_name>"
  exit 1
}

if [[ -z "$1" ]]; then
  usage
fi

project_name="$1"
project_dir="./${project_name}"

if [[ ! -d "$template_dir" ]]; then
  >&2 echo "Unable to find template directory: $template_dir"
  exit 2
fi

if [[ -d "$project_dir" ]]; then
  >&2 echo "Project directory already exists: $project_dir"
  exit 3
fi

old_dir=$(pwd)
cd "$template_dir"

echo "Please select a template:"
select template in *; do
  break
done

cd "$old_dir"

cp -r "${template_dir}/${template}" "${project_dir}"

cd "${project_dir}"
for file in *; do
  new_file=$(sed "s/PROJECTNAME/${project_name}/g" <<< "$file")
  if [[ -d "$file" ]]; then 
    cd "$file"
    for inner_file in *; do
      inner_new_file=$(sed "s/PROJECTNAME/${project_name}/g" <<< "$inner_file")
      if [[ "$inner_file" == "$inner_new_file" ]]; then
        sed "s/PROJECTNAME/${project_name}/g" < "$inner_file" > temp && mv temp "$inner_file"
      else
        sed "s/PROJECTNAME/${project_name}/g" < "$inner_file" > "$inner_new_file"
        [[ -e "$inner_new_file" ]] && rm "$inner_file"
      fi
    done
    cd ..
  elif [[ "$file" == "$new_file" ]]; then
    sed "s/PROJECTNAME/${project_name}/g" < "$file" > temp && mv temp "$file"
  else
    sed "s/PROJECTNAME/${project_name}/g" < "$file" > "$new_file"
    [[ -e "$new_file" ]] && rm "$file"
  fi
done
# chmod 777 setup
# ./setup