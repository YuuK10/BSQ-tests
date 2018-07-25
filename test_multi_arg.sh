echo "============ Multi arguments test ============\n"
../bsq tables/test_39-80.txt tables/test_68-27.txt tables/test_5.txt tables/test_100.txt
cat tables/test_5.txt | ../bsq
cat tables/test_100.txt | ../bsq
