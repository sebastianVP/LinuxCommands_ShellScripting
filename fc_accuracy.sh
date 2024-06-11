#! /bin/bash
yesterday_fc=$(tail -2 rx_poc.log | head -1 | cut -d " " -f6)
yesterday_sfc="${yesterday_fc:0:2}"
echo "yesterday_fc is $yesterday_sfc"
today_temp=$(tail -1 rx_poc.log | cut -d " " -f4)
echo "today_temp is $today_temp"
accuracy=$(($yesterday_sfc-$today_temp))
echo "accuracy is $accuracy"

