echo "Executing multi arguments tests..."
(../bsq tables/test_39-80.txt tables/test_68-27.txt tables/test_5.txt tables/test_100.txt 2>&1) > results/multi_arg_01.txt
(../bsq tables/test_5.txt tables/test_10.txt "Hello World !" tables/test_8.txt 2>&1) > results/multi_arg_02.txt
