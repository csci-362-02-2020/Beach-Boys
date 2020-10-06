
#!/bin/bash

#remove old .class files if any
rm -f testCaseExecutables/*.class
echo "Removed all .class files in the directory testCaseExecutables"

javac testCaseExecutables/*.java
echo "All files in testCaseExecutable has been compiled"

declare -a arr

touch reports/results.txt
> reports/results.txt

for file in testCases/*.txt
do
 i=0;
 while read -r line
 do
  arr[$i]="$line"
  i=$((i+1))
 done < $file

  declare testNum=${arr[0]}
  declare req=${arr[1]}
  declare component=${arr[2]}
  declare method=${arr[3]}
  declare input=${arr[4]}
  declare expected=${arr[5]}
  
 if [[ $method == "hex2rgbDriver" ]]
 then
   java testCaseExecutables.hex2rgbDriver "$input" >> reports/results.txt
 fi
 
 if [[ $method == "getBrightnessDriver" ]]
 then
   java testCaseExecutables.getBrightnessDriver "$input" >> reports/results.txt
 fi

 if [[ $method == "getSaturationDriver" ]]
 then
   java testCaseExecutables.getSaturationDriver "$input" >> reports/results.txt
 fi

 if [[ $method == "getHueDriver" ]]
 then
   java testCaseExecutables.getHueDriver "$input" >> reports/results.txt
 fi

 if [[ $method == "rgb2hexDriver" ]]
 then
   java testCaseExecutables.rgb2hexDriver "$input" >> reports/results.txt
 fi
done


rm -f testCaseExecutables/*.class
