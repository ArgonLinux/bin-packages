cd nim
mkdir gen

sh build_all.sh

# Ship all of Nim's tooling
mv bin/atlas gen/
mv bin/nim gen/
mv bin/nimble gen/
mv bin/nim-gdb gen/
mv bin/nimgrep gen/
mv bin/nimpretty gen/
mv bin/nimsuggest gen/
mv bin/testament gen/

zip -r gen.zip gen/

mv gen.zip ../gen-bin/nim.zip
