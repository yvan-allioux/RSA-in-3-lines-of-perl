# use the latest Perl image from Docker Hub
FROM perl:latest

# install the dc package
RUN apt-get update && apt-get install -y dc

# Copy the script to the image
COPY rsa /usr/local/bin/rsa

# Make the script perl executable
RUN chmod +x /usr/local/bin/rsa

# Set the working directory
COPY . /usr/local/bin/

# Make the script bash executable
RUN chmod +x /usr/local/bin/*.sh

WORKDIR /usr/local/bin/

# Define the entry point

#use the file in directory
ENTRYPOINT ["/usr/local/bin/run_rsa_openssl.sh"]

#use the value in the run_rsa.sh code
#ENTRYPOINT [ "/usr/local/bin/run_rsa.sh" ]



#docker build -t rsa-perl .
#docker run -it rsa-perl