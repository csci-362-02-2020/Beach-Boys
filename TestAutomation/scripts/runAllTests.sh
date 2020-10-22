#!/bin/bash

#remove old .class files if any
rm -f testCaseExecutables/*.class
echo "Removed all old class files in directory: testCaseExecutables"

javac testCaseExecutables/*.java
echo "All drivers have been successfully compiled"

declare -a arr

#Creates the html file and clears it if there is anything in it
touch reports/results.html
> reports/results.html

echo \<html\>\<head\>\<style\> >> reports/results.html

#Set up table border in html
echo table, th, td { >> reports/results.html

echo border: 2px solid black\; >> reports/results.html
echo border-collapse: collapse\; >> reports/results.html
echo } >> reports/results.html

#Add white space between data and row/colum lines
echo th, td { >> reports/results.html
echo padding: 5px\; >> reports/results.html
echo } >> reports/results.html

echo \</style\>\</head\>\<body\> >> reports/results.html


#Set up first row of table
echo \<table\> >> reports/results.html
echo \<tr\> >> reports/results.html
echo \<td\>"Test Number"\<\/td\> >> reports/results.html
echo \<td\>"Requirement"\<\/td\> >> reports/results.html
echo \<td\>"Component"\<\/td\> >> reports/results.html
echo \<td\>"Method"\<\/td\> >> reports/results.html
echo \<td\>"Input"\<\/td\> >> reports/results.html
echo \<td\>"Expected Output"\<\/td\> >> reports/results.html
echo \<td\>"Output"\<\/td\> >> reports/results.html
echo \<td\>"Passed?"\<\/td\> >> reports/results.html
echo \<\/tr\> >> reports/results.html
echo "Executing Drivers"

#Read in each file in the testCase directory
for file in testCases/*.txt
do
 i=0;
 #Start new row in html table
 echo \<tr\> >> reports/results.html
 
 #Read each line in the file in
 while read -r line
 do
  #Print each line in the txt file to the html table
  echo \<td\>$line\<\/td\> >> reports/results.html
  arr[$i]="$line"
  i=$((i+1))
 done < $file

  declare testNum=${arr[0]}
  declare req=${arr[1]}
  declare component=${arr[2]}
  declare method=${arr[3]}
  declare input=${arr[4]}
  declare expected=${arr[5]}
  declare output
  
 if [[ $method == "hex2rgbDriver" ]]
 then
   output=$(java testCaseExecutables.hex2rgbDriver "$input")
 fi
 
 if [[ $method == "getBrightnessDriver" ]]
 then
   output=$(java testCaseExecutables.getBrightnessDriver "$input")
 fi

 if [[ $method == "getSaturationDriver" ]]
 then
   output=$(java testCaseExecutables.getSaturationDriver "$input")
 fi

 if [[ $method == "getHueDriver" ]]
 then
   output=$(java testCaseExecutables.getHueDriver "$input")
 fi

 if [[ $method == "rgb2hexDriver" ]]
 then
   output=$(java testCaseExecutables.rgb2hexDriver "$input")
 fi
 echo \<td\>$output\<\/td\> >> reports/results.html
 
 #Check to see if test has passed
 if [[ $output == $expected ]]
 then
   echo \<td\>"Passed"\<\/td\> >> reports/results.html
 else
   echo \<td\>"Failed"\<\/td\> >> reports/results.html
 fi

  echo \<\/tr\> >> reports/results.html
done

echo \<\/table\> >> reports/results.html
echo \</body\>\</html\> >> reports/results.html
echo "Opening results in browser..."

#Open results in browser
xdg-open  reports/results.html

#Delete all .class files in testCaseExecutables directory
rm -f testCaseExecutables/*.class
