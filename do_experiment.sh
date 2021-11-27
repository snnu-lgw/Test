#!/bin/bash

func()
{ 
  if [[ -f "$HOME/2021-11-27-experiment/experiment/$1" ]]
  then
    rm -rf $HOME/2021-11-27-experiment/experiment/$1
  fi
  
  mkdir $HOME/2021-11-27-experiment/experiment/$1
  
  if [[ -f "$HOME/2021-11-27-experiment/experiment/$1/$1-N$2-T$3-U$4" ]]
  then
    rm -rf $HOME/2021-11-27-experiment/experiment/$1/$1-N$2-T$3-U$4
  fi
  
  mkdir $HOME/2021-11-27-experiment/experiment/$1/$1-N$2-T$3-U$4
  
  cp -r -f $HOME/2021-11-27-experiment/code/*.py $HOME/2021-11-27-experiment/experiment/$1/$1-N$2-T$3-U$4

  cd $HOME/2021-11-27-experiment/experiment/$1/$1-N$2-T$3-U$4

  python Data_Generator.py $1 $2 $3 $4 > $HOME/2021-11-27-experiment/results/Data_Generator-$1-N$2-T$3-U$4-result.txt
  python abaa.py $1 $2 $3 $4 > $HOME/2021-11-27-experiment/results/abaa-$1-N$2-T$3-U$4-result.txt &
  python wqaa-5.py $1 $2 $3 $4 5 > $HOME/2021-11-27-experiment/results/wqaa-5-$1-N$2-T$3-U$4-result.txt &
  python wqaa-10.py $1 $2 $3 $4 10 > $HOME/2021-11-27-experiment/results/wqaa-5-$1-N$2-T$3-U$4-result.txt &
  python ga-Data-Generator.py $1 $2 $3 $4 > $HOME/2021-11-27-experiment/results/ga-Data-Generator-$1-N$2-T$3-U$4-result.txt
  
  python ga-abaa.py $1 $2 $3 $4 $5 > $HOME/2021-11-27-experiment/results/ga-abaa-$1-N$2-T$3-U$4-$5-result.txt &
  python ga-wqaa-5.py $1 $2 $3 $4 $5 > $HOME/2021-11-27-experiment/results/ga-wqaa-5-$1-N$2-T$3-U$4-$5-result.txt &
  python ga-wqaa-10.py $1 $2 $3 $4 $5 > $HOME/2021-11-27-experiment/results/ga-wqaa-10-$1-N$2-T$3-U$4-$5-result.txt &
  #Iteration=`expr $5 \* 2`
  #python ga-abaa.py $1 $2 $3 $4 $Iteration > $HOME/2021-11-27-experiment/results/ga-abaa-$1-N$2-T$3-U$4-$Iteration-result.txt &
  #python ga-wqaa.py $1 $2 $3 $4 $Iteration > $HOME/2021-11-27-experiment/results/ga-wqaa-$1-N$2-T$3-U$4-$Iteration-result.txt &
}


typeT1=1000
typeT2=1500
typeT3=2500
userU1=3000
userU2=5000
userU3=6000
iterationN=300
courseN1=1000
courseN2=2000
courseN3=5000

#func U $courseN1 $typeT $userU $iterationN &
#func U $courseN1 $typeT $userU $iterationN &
#func U $courseN1 $typeT $userU $iterationN &
#func 1 $courseN1 $typeT $userU $iterationN &

func N $courseN1 $typeT1 $userU3 $iterationN &
func N $courseN3 $typeT1 $userU3 $iterationN &

func N $courseN2 $typeT2 $userU3 $iterationN &
func N $courseN2 $typeT3 $userU3 $iterationN &

func N $courseN2 $typeT1 $userU1 $iterationN &
func N $courseN2 $typeT1 $userU2 $iterationN &
#func N $courseN1 $typeT $userU $iterationN &

#func 2 $courseN1 $typeT $userU $iterationN &

#func E $courseN1 $typeT $userU $iterationN &
#func E $courseN1 $typeT $userU $iterationN &
#func E $courseN1 $typeT $userU $iterationN &
#func 3 $courseN1 $typeT $userU $iterationN &
