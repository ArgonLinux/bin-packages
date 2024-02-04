cd shunya
mkdir gen

nimble build -d:release -d:flto -d:speed
mv shunya gen/
zip -r gen.zip gen/

mv gen.zip ../gen-bin/shunya.zip
