#!/bin/zsh

clear
echo "\n                                \e[33mBSQ Tests - By \e[39m"
cat header.md

echo "\nOk, let's test your BSQ."
echo "\e[33m================================================================================\e[39m\n"
echo "I am creating a 'results' directory where you'll find the results\n"
(rm -rf results 2>&1) > /dev/null
mkdir results > /dev/null 2>&1
sh test_table.sh
sh test_multi_arg.sh
sh test_inline.sh
sh bad_tests.sh
echo "\e[33m================================================================================\e[39m\n"
#echo "Let's compare your results hashs with the reference ones...\n"

RESULT_FILES="$(find results/*.txt | sort)"

if [[ $OSTYPE = darwin* ]]; then
	md5 -r results/*.txt | sort -d -k 2,2 > hash.txt
	sed -i '' 's/  / /g' "hash.txt"
else
	md5sum results/*.txt | sort -d -k 2,2 > hash.txt
	#ls -Q -v -x -w 0 "results/" | sed 's/ / results\//g' | xargs md5sum > hash.txt
	sed -i 's/  / /g' "hash.txt"
fi


DIFF="$(diff "hash.txt" "hash_ref.txt" | grep '<' | cut -d ' ' -f3)"
ANSWER=""

if [ -z "$DIFF" ]; then
	echo "		>>>>>> \e[32mSUCCESS\e[39m <<<<<<\n"
	echo "It looks the same, your BSQ passes all the tests !"
else
	echo "		>>>>>> \e[31mFAILURE\e[39m <<<<<<\n"
	echo -n "Do you want to see what test(s) are failing ? (Y/N) "
	
	while [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "n" && $ANSWER != "N" ]]; do
		read ANSWER
		if [[ $ANSWER == "Y" || $ANSWER == "y" ]]; then
			echo "Ok, here are the solutions that differ :\n"
			echo "\e[33m--------------------------------------------------------------------------------\e[39m\n"
			echo "${DIFF}\n"
			echo "\e[33m--------------------------------------------------------------------------------\e[39m\n"
		elif [[ $ANSWER != "N" && $ANSWER != "n" ]]; then
			echo -n "Please only type Y or N "
		fi
	done

	if [[ $ANSWER == "Y" || $ANSWER == "y" ]]; then
		ANSWER=""
		echo -n "\nDo you want to download the reference solutions to get a detailed diff ? (Y/N) "
		while [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "n" && $ANSWER != "N" ]]; do
			read ANSWER
			if [[ $ANSWER == "Y" || $ANSWER == "y" ]]; then
				echo "Ok, downloading...\n"
				(svn export https://github.com/YuuK10/BSQ-tests.git/branches/results/ref_results 2>&1) > /dev/null
				D_DIFF="\nHere's the diff (press q to exit) :\n\n"
				for file in results/*; do
					DIFF="$(diff -cN "${file}" "ref_results/${file##*/}")"
					if [ ! -z "$DIFF" ]; then
						D_DIFF="$D_DIFF $DIFF\n\n=============================\n\n"
					fi
				done
				echo $D_DIFF | less
			elif [[ $ANSWER != "N" && $ANSWER != "n" ]]; then
				echo -n "Please only type Y or N "
			fi
		done
	fi
fi
echo "\n\e[33mAlright, it's over. You'll find the results in the 'results' directory."
