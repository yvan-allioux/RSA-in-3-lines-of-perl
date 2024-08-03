


http://www.cypherspace.org/adam/rsa/rsa-details.html


RSA Encryption with Perl and Docker
===================================

Overview
--------

This repository contains a Perl program that implements RSA encryption and decryption. It has been containerized using Docker and includes scripts to facilitate encryption tasks and testing of the Perl code.

```
#!/bin/perl -sp0777i<X+d*lMLa^*lN%0]dsXx++lMlN/dsM0<j]dsj
$/=unpack('H*',$_);$_=`echo 16dio\U$k"SK$/SM$n\EsN0p[lN*1
lK[d2%Sa2/d0$^Ixp"|dc`;s/\W//g;$_=pack('H*',/((..)*)$/)
```

### Historical Context

This Perl program, which implements RSA encryption and decryption, is small enough to use as a signature file. Peter Junger, a law professor in the US, obtained from the US Commerce Department a written statement ruling that this program must not be exported from the US.

[source of the famous perl code](http://www.cypherspace.org/adam/rsa/)

[source of the famous perl code 2](http://www.cypherspace.org/adam/rsa/rsa-details.html)

Crypto wars is an informal term referring to the efforts by the US government to limit public and foreign access to cryptographic methods strong enough to resist cryptanalysis by its intelligence agencies, particularly the NSA. By 2005, the Crypto Wars were considered "won" by public access to strong encryption. However, revelations by Edward Snowden, particularly about the Bullrun program aimed at secretly weakening encryption algorithms and their implementations, challenged the outcome of the Crypto Wars and reignited the debate on the public's need for strong encryption. Following revelations about the NSA, renewed efforts to bring strong encryption to the public, especially the default encryption of Apple's iPhones, led the US government to reiterate its calls to limit public access to encryption without backdoors, surprising privacy advocates who thought the fight for public rights to strong encryption was definitively won.

[wikipedia Crypto Wars](https://en.wikipedia.org/wiki/Crypto_Wars)

Repository Structure
--------------------

-   `Dockerfile`: Facilitates easy deployment of the RSA encryption code.
-   `rsa/`: Contains the Perl code for RSA encryption.
-   `private.key`, `public.key`: Generated keys using `set_key.sh`.
-   `private_key_values.txt`, `public_key_values.txt`: Same keys as above but in a different format for educational purposes.
-   `README.md`: This documentation file.
-   `display_key.sh`: Script to extract and display keys from `private_key_values.txt` and `public_key_values.txt`.
-   `run_rsa.sh`: Script to run the Perl RSA encryption with keys defined within the script.
-   `run_rsa_openssl.sh`: Script to run the Perl RSA encryption with keys from `private_key_values.txt` and `public_key_values.txt`.
-   `set_key.sh`: Script to generate keys using OpenSSL. Takes key size as a parameter.

How to Use
----------

### Step 1: Generate Keys

Generate RSA keys using the `set_key.sh` script. Specify the key size as an argument, for example:

`./set_key.sh 512

or

./set_key.sh 2048`

This will create or overwrite `private.key`, `public.key`, `private_key_values.txt`, and `public_key_values.txt`.

To view the keys in a human-readable format, use the `display_key.sh` script:

`./display_key.sh`

### Step 2: Build the Docker Image

To build the Docker image, navigate to the repository's root directory and run:

`docker build -t rsa-encryption .`

### Step 3: Run the Perl RSA Script in docker

#### Using Keys from Generated Files, build docker image

To run the RSA encryption with keys from the generated files just launch this command, the dockerfile is configured to use `private_key_values.txt` and `public_key_values.txt` :

`docker build -t rsa-perl .`

#### Using Keys Defined in the Script

To run the RSA encryption with exeample keys directly defined in the script, use `run_rsa.sh` modify in dockerfile to set the script:

`docker build -t rsa-perl .`


### Step 5: Running with Docker

RUN:

`docker run -it rsa-perl`

for exeample, that give this in the terminal :

Extract public key values
Exposant : 0x10001
Modulus : 00bb3d5b7a08d3da50f944562e2bb22098fe2ce5d7bc32900caf8409bdebffeef0666646c4758ffb850eb388d26e6440d292bb97bd0023e7006e059eeccfe20eab
Extract private key values
Private exponent : 4ea5cf2ecb56717561be9a947a36300b1378b8728dd28f3f44da295d652bf3a8be88e4f56925739f1ae6692f1fe739e8c74a45ed977f1b79436c40503290e801
Modulus of private key : 00bb3d5b7a08d3da50f944562e2bb22098fe2ce5d7bc32900caf8409bdebffeef0666646c4758ffb850eb388d26e6440d292bb97bd0023e7006e059eeccfe20eab
Encrypt message
-i used with no filenames on the command line, reading from STDIN.
Encrypted message (not copy-pasteable) :

NkDvl\f<C)>ڋ8ŉJԯFNhA(sTd?xNDecrypted message :
-i used with no filenames on the command line, reading from STDIN.
salut ça va ?

Conclusion
----------

This repository provides a simple yet powerful demonstration of RSA encryption using Perl, enhanced by Docker for ease of use. Follow the steps outlined above to generate keys, display them for educational purposes, and run the encryption scripts. The historical context underscores the significance of strong encryption in the ongoing debate over privacy and security.


