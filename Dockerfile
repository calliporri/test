# Gunakan image dasar Ubuntu 22.04
FROM ubuntu:22.04

# Setel direktori kerja
WORKDIR /root

# Perbarui dan instal dependensi yang diperlukan
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    net-tools \
    sudo

# Unduh dan ekstrak file tar.gz
RUN wget https://network3.io/ubuntu-node-v2.1.1.tar.gz && \
    tar -xf ubuntu-node-v2.1.1.tar.gz

# Pindah ke direktori ubuntu-node
WORKDIR /root/ubuntu-node

# Jalankan perintah untuk mengatur node
RUN sudo bash manager.sh up
RUN sudo bash manager.sh key

# Ekspos port jika diperlukan
# EXPOSE <port>

# Tentukan perintah default yang akan dijalankan (misalnya, bash)
CMD ["/bin/bash"]
