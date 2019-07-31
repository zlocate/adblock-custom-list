#/bin/sh
aria2c --continue=true -i sources.txt -d tmp && \
awk '{sub(/^127.0.0.1/, "0.0.0.0")} /^0.0.0.0/' ./tmp/*.txt > ./all.txt && \
awk '{sub(/\r$/,"");print $1,$2}' ./all.txt | sort -u --parallel 8 > ./hosts.deny && \
rm -rf ./tmp/* all.txt

