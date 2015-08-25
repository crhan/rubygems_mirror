#!/usr/bin/env bash

echo "hello world"
exit

count=`ps aux | grep mirror:update | wc -l`
if [ ${count} -lt 2 ] ; then

	echo
	echo "------- start at $(date)"
	cd /app/rubygems-mirror/ && bundle exec rake mirror:update

	echo
	echo "------- database sync start at $(date)"

	cd /app/bundler-api/
	bundle exec rake update[100]
	echo
	echo "------- end at $(date)"
fi
