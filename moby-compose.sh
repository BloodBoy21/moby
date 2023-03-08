#!/bin/bash

customPath=${!#}
echo $customPath 

# Check if the variable contains a directory path
if [ -d "$customPath" ]; then
  dir=$customPath 
else
  dir="."
fi

file=$(find $dir  -type f \( -name "docker-compose*.yml" -o -name "docker-compose*.json" \) | fzf)




if [ -z "$file" ]; then
    echo "No docker-compose file found"
    exit 1
fi

#check if docker-compose is installed
if ! [ -x "$(command -v docker-compose)" ]; then
    echo "docker-compose is not installed"
    exit 1
fi

flag=false
while getopts ":udb" opt; do
  case $opt in
    u)
    docker-compose -f $file up -d
      flag=true
      ;; 
    d)
      docker-compose -f $file down
      flag=true
      ;;
    b)
        docker-compose -f $file build
        flag=true
        ;;
    h)
      echo "Usage: moby-compose.sh [-u] [-d] [-b]"
      echo "  -u: up"
      echo "  -d: down"
      echo "  -b: build"
      flag=true
    ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done
if [ "$flag" = false ]; then
    docker-compose -f $file up -d
fi

