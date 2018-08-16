#!/bin/zsh

cat header.md
echo "\nOk, let's test your BSQ."
echo "========================\n"
echo "I am creating a 'results' directory where you'll find the results\n"
mkdir results > /dev/null 2>&1
rm -rf results/*
sh test_table.sh
sh test_multi_arg.sh
sh bad_tests.sh
echo "\n========================\n"
echo "Let's compare your results hashs with the reference ones...\n"

#md5 results/*.txt | cut -d ' ' -f 4 > results/hash.txt
md5sum results/*.txt > results/hash.txt

DIFF="$(diff results/hash.txt hash_ref.txt | grep '<' | cut -d ' ' -f4)"
ANSWER=""

if [ -z "$DIFF" ]; then
	echo "		>>>>>> \e[32mSUCCESS\e[39m <<<<<<\n"
	echo "It looks the same, your BSQ passes all the tests !"
else
	echo "		>>>>>> \e[31mFAILURE\e[39m <<<<<<\n"
	echo "Do you want to see what test(s) are failing ? (Y/N) "
	
	while [[ $ANSWER != "Y" && $ANSWER != "N" ]]; do
		read ANSWER
		if [[ $ANSWER == "Y" ]]; then
			echo "Ok, there's a problem. Here are the solutions that differ :\n"
			echo "${DIFF}"
		elif [[ $ANSWER != "N" ]]; then
			echo "Please only type Y or N "
		fi
	done
fi
echo "\nAlright, it's over. You'll find the results in the 'results' directory."
