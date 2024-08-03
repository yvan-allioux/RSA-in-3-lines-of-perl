#!/bin/bash

echo ----

echo Extract public key values
e=$(openssl rsa -pubin -in public.key -text -noout | grep 'Exponent' | awk -F '[()]' '{print $2}')
echo Exposant : $e

n=$(openssl rsa -pubin -in public.key -text -noout | grep -A 100 'Modulus' | grep -v 'Exponent' | tr -d '\n' | sed 's/.*Modulus://; s/ //g; s/://g')
echo Modulus : $n

echo Extract private key values
d=$(openssl rsa -in private.key -text -noout | awk '/privateExponent:/,/prime1:/ {if (!/privateExponent:/ && !/prime1:/) print}' | tr -d '\n' | sed 's/ //g; s/://g')
echo Private exponent : $d


np=$(openssl rsa -in private.key -text -noout | awk '/modulus:/,/publicExponent:/ {if (!/modulus:/ && !/publicExponent:/) print}' | tr -d '\n' | sed 's/ //g; s/://g')
echo Modulus of private key : $np

echo "Encrypt message"
#the message is "salut ça va ?"
cat message_input.txt | /usr/local/bin/rsa -k=$e -n=$n > msg.rsa

# Display encrypted message
echo "Encrypted message (not copy-pasteable) :"
cat msg.rsa

# Unencrypt message
echo "Decrypted message :"
/usr/local/bin/rsa -d -k=$d -n=$n < msg.rsa
