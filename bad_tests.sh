echo "Executing error tests...\n"
(../bsq tables/bad/test_100_bad_1.txt 2>&1) > results/bad_1.txt
(../bsq tables/bad/test_100_bad_2.txt 2>&1) > results/bad_2.txt
(../bsq tables/bad/test_100_bad_3.txt 2>&1) > results/bad_3.txt
(../bsq tables/bad/test_100_bad_4.txt 2>&1) > results/bad_4.txt
(../bsq tables/bad/test_100_bad_5.txt 2>&1) > results/bad_5.txt
(../bsq tables/bad/test_100_bad_6.txt 2>&1) > results/bad_6.txt
(../bsq tables/bad/test_100_bad_7.txt 2>&1) > results/bad_7.txt
(../bsq tables/bad/test_100_bad_8.txt 2>&1) > results/bad_8.txt
(../bsq bad_file 2>&1) > results/bad_file.txt
#../bsq tables/ 2>&1 > results/bad_directory.txt
