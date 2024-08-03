#/bin/bash
rm -f private.key public.key public_key_values.txt private_key_values.txt

echo "Génération de la clé RSA de $1 bits"

openssl genpkey -algorithm RSA -out private.key -pkeyopt rsa_keygen_bits:$1
openssl rsa -pubout -in private.key -out public.key

# Ectract public key values
openssl rsa -pubin -in public.key -text -noout > public_key_values.txt

# Extract private key values
openssl rsa -in private.key -text -noout > private_key_values.txt

