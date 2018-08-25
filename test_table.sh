echo "Executing standard algorithm tests..."
../bsq tables/test_1.txt 2>&1 > results/test_1.txt
../bsq tables/test_1_full.txt 2>&1 > results/test_1_full.txt
../bsq tables/test_5.txt 2>&1 > results/test_5.txt
../bsq tables/test_8.txt 2>&1 > results/test_8.txt
../bsq tables/test_10.txt 2>&1 > results/test_10.txt
../bsq tables/test_charset.txt 2>&1 > results/test_charset.txt
../bsq tables/test_100.txt 2>&1 > results/test_100.txt
../bsq tables/test_100_full.txt 2>&1 > results/test_100_full.txt
../bsq tables/test_100_empty.txt 2>&1 > results/test_100_empty.txt
../bsq tables/test_100_big_sol.txt 2>&1 > results/test_100_big_sol.txt
../bsq tables/test_1000.txt 2>&1 > results/test_1000.txt

echo "Executing advanced algorithm tests..."

../bsq tables/test_vert.txt 2>&1 > results/test_vert.txt
../bsq tables/test_hor.txt 2>&1 > results/test_hor.txt
../bsq tables/test_vert2.txt 2>&1 > results/test_vert2.txt
../bsq tables/test_hor2.txt 2>&1 > results/test_hor2.txt
../bsq tables/test_last_row.txt 2>&1 > results/test_last_row.txt
../bsq tables/test_last_row2.txt 2>&1 > results/test_last_row2.txt
../bsq tables/test_last_row3.txt 2>&1 > results/test_last_row3.txt
../bsq tables/test_last_row4.txt 2>&1 > results/test_last_row4.txt
../bsq tables/test_39-80.txt 2>&1 > results/test_39-80.txt
../bsq tables/test_68-27.txt 2>&1 > results/test_68-27.txt
../bsq tables/test_500.txt 2>&1 > results/test_500.txt
../bsq tables/test_5000.txt 2>&1 > results/test_5000.txt
../bsq tables/test_10000.txt 2>&1 > results/test_10000.txt

