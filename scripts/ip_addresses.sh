#!/bin/bashresult.txt

connections="$(grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' result.txt | sort | uniq )"

for ip in $connections
do
  count="$(grep -oE "$ip" result.txt | wc -l)"
echo "$ip" - "$count"
done
