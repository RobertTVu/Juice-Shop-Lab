#Set up Kali env

FROM kalilinux/kali-rolling

# Update package manager
RUN apt update --fix-missing && apt upgrade -y

#Base tools
RUN apt install -y \
    git \
    wget \
    curl \
    nano \
    vim \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    python3 \
    python3-pip \
    tree \
    bat \
    btop

# DAST Scan
#------------------------
RUN apt install -y nuclei 

# Content Discovery
#------------------------
RUN apt install -y feroxbuster

# Bruteforce / Fuzzing
#------------------------
RUN apt install -y ffuf

# SQL Injection
#------------------------
RUN apt install -y sqlmap

# Password Cracking
#------------------------
RUN apt install -y hashcat hash-identifier

# Wordlists
#------------------------
# Seclists: /usr/share/seclists/Passwords/Common-Credentials/best1050.txt
# dirb:     /usr/share/wordlists/dirb/common.txt, small.txt, big.txt

RUN apt install -y seclists wordlists dirb


# Clean up apt cache to reduce image size
RUN apt clean && rm -rf /var/lib/apt/lists/*


# Working directory
WORKDIR /pentest

# Copy example commands
COPY examples.sh /pentest/examples.sh
RUN chmod +x /pentest/examples.sh


# Env variables
ENV LC_ALL=C.UTF-8
ENV RUNNING_IN_DOCKER=true

# Default shell
CMD ["zsh"]