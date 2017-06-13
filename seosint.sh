#!/bin/bash
start=0

out=$(curl -A 'Mozilla/5.0 (MSIE; Windows 10)'  "https://www.google.com/search?q=site:$1&num=100&newwindow=1&&start=$start" -sL | base64)

echo $out | tr " " "\n" | base64 -d | grep -o "href=\"/url?q=\S*"|grep -v webcache.googleusercontent | cut -d "=" -f 3- | cut -d ";" -f 1 | sed 's/&amp$//g'

more=$(echo $out | tr " " "\n" | base64 -d|grep -o "<span style=\"display:block;margin-left:53px\">.*</span>")

while [ "$more" != "" ] 
do
    start=$(($start+100))
    out=$(curl -A 'Mozilla/5.0 (MSIE; Windows 10)'  "https://www.google.com.br/search?q=site:$1&num=100&newwindow=1&&start=$start" -sL | base64)
    echo $out | tr " " "\n" | base64 -d | grep -o "href=\"/url?q=\S*" | grep -v webcache.googleusercontent | cut -d "=" -f 3- | cut -d ";" -f 1 | sed 's/&amp$//g'
    more=$(echo $out | tr " " "\n" | base64 -d | grep -o "<span style=\"display:block;margin-left:53px\">\S*</span>")
done
