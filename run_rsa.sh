#!/bin/bash


# tesl val e 65537 n 009e50b16bd640aac3bc02dd3f3894 d 0cb314bb12f446b3d887484a892b8e

# encrypt message
echo "salut ça va ?" | /usr/local/bin/rsa -k=0x10001 -n=00de25a80555f6bb94c408c7d1c0699bb29fa39020ad5940bb556e263b293b5e3f728d46b314c438a4e605ba85ab11399a8f6416a34243415d2e4c42bd27671967 > msg.rsa

# display encrypted message
echo "Encrypted message : "

cat msg.rsa

# decrypt message

echo "Decrypted message : "

/usr/local/bin/rsa -d -k=00aebd5228385167860299a18c355d1d12e98dc04e63ed0405179318518b025f03f44c19d9ee94e447801806944c27bb9683a1992f9ead3cc2330cad302ff9ab01 -n=00de25a80555f6bb94c408c7d1c0699bb29fa39020ad5940bb556e263b293b5e3f728d46b314c438a4e605ba85ab11399a8f6416a34243415d2e4c42bd27671967 < msg.rsa
