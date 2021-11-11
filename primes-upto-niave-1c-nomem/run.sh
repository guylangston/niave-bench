set -e

echo "============================================="
uname -a
lscpu
echo "---------------------------------------------"

proj=$(ls *.csproj)
count=1
size="$(echo "$proj" | wc -l)"
for p in $proj; do
    echo "Project ($count/$size): $p"
    # bat $p
    echo "[dotnet] $ dotnet run -c Release --project $p"
    dotnet run -c Release --project $p
    count=$(( count + 1 ))
    echo ""
    echo ""
done

echo "[MONO]"
mono --version
mcs -optimize+ Program.cs -out:./bin/Program-mono.exe
mono ./bin/Program-mono.exe

echo ""
echo "[gcc]"
gcc --version
gcc bench.c -O3 -lm --output ./bin/bench-gcc && ./bin/bench-gcc

echo ""
echo "[clang]"
clang --version
clang bench.c -O3 -lm --output ./bin/bench-clang && ./bin/bench-clang

echo ""
echo "[python] Slow and I am not sure why?"
python --version
time python ./bench.py
