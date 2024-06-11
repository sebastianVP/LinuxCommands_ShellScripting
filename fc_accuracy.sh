#! /bin/bash
yesterday_fc=$(tail -2 rx_poc.log | head -1 | cut -d " " -f6)
yesterday_sfc="${yesterday_fc:0:2}"
echo "yesterday_fc is $yesterday_sfc"
today_temp=$(tail -1 rx_poc.log | cut -d " " -f4)
echo "today_temp is $today_temp"
accuracy=$(($yesterday_sfc-$today_temp))
echo "accuracy is $accuracy"

if [ -1 -le $accuracy ] && [ $accuracy -le 1 ]
then
	accuracy_range=excellent
elif [ -2 -le $accuracy ] && [ $accuracy -le 2 ]
then
	accuracy_range=good
elif [ -3 -le $accuracy ] && [ $accuracy -le 3 ]
then
	accuracy_range=fair 
else
	accuracy_range=poor
fi
echo "Forecast accuracy is $accuracy"

row=$(tail -1 rx_poc.log)
year=$( echo $row | cut -d " " -f1)
month=$( echo $row | cut -d " " -f2)
day=$( echo $row | cut -d " " -f3)
echo -e "$year\t$month\t$day\t$today_temp\t$yesterday_sfc\t$accuracy\t$accuracy_range" >> historical_fc_accuracy.tsv

