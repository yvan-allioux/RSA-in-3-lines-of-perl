# use the latest Perl image from Docker Hub
FROM perl:latest

# install the dc package
RUN apt-get update && apt-get install -y dc

# Copy the script to the image
COPY rsa /rsa

# Make the script perl executable
RUN chmod +x /rsa

# Set the working directory
COPY . /

# Make the script bash executable
RUN chmod +x /*.sh

WORKDIR /

# Define the entry point

#use the file in directory
ENTRYPOINT ["/run_rsa_openssl.sh"]

#use the value in the run_rsa.sh code
#ENTRYPOINT [ "/run_rsa.sh" ]



#docker build -t rsa-perl .
#docker run -it rsa-perl