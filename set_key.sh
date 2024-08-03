#/bin/bash
rm -f key/private.key key/public.key key/public_key_values.txt key/private_key_values.txt

echo "Génération de la clé RSA de $1 bits"

openssl genpkey -algorithm RSA -out key/private.key -pkeyopt rsa_keygen_bits:$1
openssl rsa -pubout -in key/private.key -out key/public.key

# Ectract public key values
openssl rsa -pubin -in key/public.key -text -noout > key/public_key_values.txt

# Extract private key values
openssl rsa -in key/private.key -text -noout > key/private_key_values.txt

