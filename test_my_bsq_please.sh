echo "Ok, let's test your BSQ.\n"
echo "I am creating a 'results' directory where you'll find the results"
mkdir results > /dev/null 2>&1
echo "Now testing small to big tables..."
sh test_table.sh > results/test_table.txt
echo "Now testing multi arguments..."
sh test_multi_arg.sh > results/test_multi_arg.txt
echo "Now testing bad tables (just to see how it reacts)..."
sh bad_tests.sh > results/test_bad.txt
echo "\nLet's compare your results hashs with the reference one...\n"

md5 results/test_table.txt results/test_multi_arg.txt results/test_bad.txt | cut -d ' ' -f 4 > results/hash.txt

DIFF="$(diff -u results/hash.txt hash_ref.txt)"
if [ -z "$DIFF" ]
then
    echo "It looks the same, your BSQ passes all the tests !"
else
    echo "It differs..."
echo "${DIFF}"
fi
echo "\nAlright, it's over. You'll find the results in the 'results' directory."
