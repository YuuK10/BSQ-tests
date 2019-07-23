echo "Executing standard input tests..."

echo "1.ox\n....." | ../bsq 2>&1 > results/stdin_01.txt
echo "Hello world !" | ../bsq 2>&1 > results/stdin_02.txt
cat tables/test_5.txt | ../bsq 2>&1 > results/stdin_03.txt
cat tables/test_100.txt | ../bsq 2>&1 > results/stdin_04.txt
