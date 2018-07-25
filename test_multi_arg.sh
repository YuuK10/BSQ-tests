echo "============ Multi arguments test ============\n"
../bsq tables/test_39-80.txt tables/test_68-27.txt tables/test_5.txt tables/test_100.txt

echo "1.ox\n....." | ../bsq 2>&1
echo "Hello world !" | ../bsq 2>&1
cat tables/test_5.txt | ../bsq
cat tables/test_100.txt | ../bsq
