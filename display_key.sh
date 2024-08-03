#/bin/bash

echo Extract public key values"\n"
e=$(openssl rsa -pubin -in key/public.key -text -noout | grep 'Exponent' | awk -F '[()]' '{print $2}')
echo Exposant : $e"\n"

n=$(openssl rsa -pubin -in key/public.key -text -noout | grep -A 100 'Modulus' | grep -v 'Exponent' | tr -d '"\n"' | sed 's/.*Modulus://; s/ //g; s/://g')
echo Modulus : $n"\n"

echo Extract private key values"\n"
d=$(openssl rsa -in key/private.key -text -noout | awk '/privateExponent:/,/prime1:/ {if (!/privateExponent:/ && !/prime1:/) print}' | tr -d '"\n"' | sed 's/ //g; s/://g')
echo Private exponent : $d"\n"


np=$(openssl rsa -in key/private.key -text -noout | awk '/modulus:/,/publicExponent:/ {if (!/modulus:/ && !/publicExponent:/) print}' | tr -d '"\n"' | sed 's/ //g; s/://g')
echo Private key modulus : $np"\n"
