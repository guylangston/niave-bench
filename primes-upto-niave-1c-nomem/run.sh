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
mcs -optimize+ Program.cs -out:./bin/Program-mono.exe
mono ./bin/Program-mono.exe

echo ""
echo "[gcc]"
gcc bench.c -O3 -lm --output ./bin/bench-gcc && ./bin/bench-gcc

echo ""
echo "[clang]"
clang bench.c -O3 -lm --output ./bin/bench-clang && ./bin/bench-clang

