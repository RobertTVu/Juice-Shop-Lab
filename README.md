# OWASP Juice Shop Pentest Environment


A Docker penetration testing environment for vulnerability analysis of [OWASP Juice Shop](https://owasp.org/www-project-juice-shop/).  


This project provides a ready-to-use pentest lab using Docker Compose with two containers:

- **Kali Linux** - Pre-installed with CLI-based security tools
- **OWASP Juice Shop** - Intentionally vulnerable web application (target)


Both containers run on a shared Docker network, allowing the Kali container to reach Juice Shop at `http://juice-shop:3000`.


## Tools Included

| Category | Tool | Description |
|---|---|---|
| DAST Scanner | Nuclei | Automated vulnerability scanner |
| Content Discovery | Feroxbuster | Directory and file brute forcing |
| Brute Force / Fuzzing | ffuf | Web fuzzer for login brute force |
| SQL Injection | SQLmap | Automated SQL injection |
| Password Cracking | Hashcat | Advanced password recovery |
| Hash Analysis | hash-identifier | Identify hash types |

### Wordlists

Pre-installed via `seclists` and `dirb` packages:

- `/usr/share/seclists/Passwords/Common-Credentials/best1050.txt`
- `/usr/share/wordlists/dirb/common.txt`
- `/usr/share/wordlists/dirb/small.txt`
- `/usr/share/wordlists/dirb/big.txt`


## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)
- A web browser and [Burp Suite](https://portswigger.net/burp) on your host machine for GUI-based testing


## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/RobertTVu/owasp-juice-shop-pentest.git
cd owasp-juice-shop-pentest
```

### 2. Build and start the environment

```bash
docker compose up -d
```

### 3. Connect to the Kali container

```bash
docker exec -it kali-pentest zsh
```

### 4. Access Juice Shop

- From your browser: `http://localhost:3000`
- From the Kali container: `http://juice-shop:3000`

### 5. Stop the environment

```bash
docker compose down
```
## Example Usage

Example commands are available inside the Kali container:

```bash
cd /pentest
cat examples.sh
```

## Disclaimer
```md
This environment is intended for educational purposes only.
```
