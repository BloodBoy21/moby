#!/bin/bash

#check if docker is installed
if ! [ -x "$(command -v docker)" ]; then
	echo "docker is not installed"
	exit 1
fi

function get_id() {
	container=$(docker ps | awk '{print $2 ":" $1}' | tail -n+2 | fzf)
	IFS=':' read -ra containerData <<<"$container"
	if [ -z "$containerData" ]; then
		echo "No container selected"
		exit 1
	fi
	id=${containerData[-1]}
	if [ -z "$id" ]; then
		echo "No container selected"
		exit 1
	fi
}

if [ "$1" != "-h" ]; then
	get_id
fi

flag=false
while getopts ":lbrsdh" opt; do
	case $opt in
	l)
		docker logs -f --color $id
		flag=true
		;;
	b)
		docker exec -it $id bash
		flag=true
		;;
	r)
		docker restart $id
		flag=true
		;;
	s)
		docker stop $id
		flag=true
		;;
	d)
		docker stop $id && docker rm $id
		flag=true
		;;
	h)
		echo "Usage: moby.sh [-l] [-b] [-r] [-s] [-d]"
		echo "  -l: logs"
		echo "  -b: bash"
		echo "  -r: restart"
		echo "  -s: stop"
		echo "  -d: delete"
		echo "  -h: help"
		flag=true
		;;
	\?)
		echo "Invalid option: -$OPTARG" >&2
		exit 1
		;;
	esac
done
if [ "$flag" = false ]; then
	docker logs -f $id
fi
