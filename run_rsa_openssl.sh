#!/bin/bash

echo ----

echo - Extract public key values
e=$(openssl rsa -pubin -in key/public.key -text -noout | grep 'Exponent' | awk -F '[()]' '{print $2}')
echo Exposant : $e

n=$(openssl rsa -pubin -in key/public.key -text -noout | grep -A 100 'Modulus' | grep -v 'Exponent' | tr -d '\n' | sed 's/.*Modulus://; s/ //g; s/://g')
echo Modulus : $n

echo - Extract private key values
d=$(openssl rsa -in key/private.key -text -noout | awk '/privateExponent:/,/prime1:/ {if (!/privateExponent:/ && !/prime1:/) print}' | tr -d '\n' | sed 's/ //g; s/://g')
echo Private exponent : $d


np=$(openssl rsa -in key/private.key -text -noout | awk '/modulus:/,/publicExponent:/ {if (!/modulus:/ && !/publicExponent:/) print}' | tr -d '\n' | sed 's/ //g; s/://g')
echo Modulus of private key : $np

echo "Encrypt message"
#the message is "salut ça va ?"
cat message_input.txt | /rsa -k=$e -n=$n > msg.rsa
cat message_input.txt | /rsa -k=$e -n=$n > /output/msg.rsa #   with    docker run -v $(pwd)/output:/output rsa-perl     for the encrypted message to be saved in the output folder

# Display encrypted message
echo "- Encrypted message (not copy-pasteable) :"
cat msg.rsa

echo " "

# Unencrypt message
echo "- Decrypted message :"
/rsa -d -k=$d -n=$np < msg.rsa
/rsa -d -k=$d -n=$np < message_input.rsa > /output/msg.txt
