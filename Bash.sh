#! /bin/bash

echo "[" > script.json
counter=0
ps -eo pcpu,pid,user,args | sort -k 1 -nr | head -n 5



 | while read line
do 
    if ((counter > 0))
    then 
    echo "," >> script.json
    fi

    pid=$(echo $line | cut -d " " -f 2 )
    cpu=$(echo $line | cut -d " " -f 1 )
    user=$(echo $line | cut -d " " -f 3 )
    echo "{ \"pid\" : "$pid" , 
    \"cpu\": "$cpu",
    \"user\": \"$user\" }" >> script.json

    ((counter++))
done
    
echo "]" >> script.json