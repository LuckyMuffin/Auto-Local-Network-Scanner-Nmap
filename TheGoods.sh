#DISCLAIMER; you should add the following paths to your system to allow for the proper loging and collection of the scans. Feel free to change them to your own unique file hierarchy.
      /path/to/original/script.sh
      /BadMuffin/ScanLogs/FoundHosts
      /BadMuffin/ScanLogs/ScannedHosts




#!/bin/bash
> /BadMuffin/ScanLogs/FoundHosts
> /BadMuffin/ScanLogs/ScannedHosts

arp-scan --localnet --numeric --quiet --ignoredups | awk '{print $1}' | grep -v 
Starting | grep -v Interface | grep -v packets | grep -v Ending | grep -v respon
ded | grep -v "arp-scan" >> /BadMuffin/ScanLogs/FoundHosts | echo "Arp Scan Comp
lete... Starting NMAP"

nmap -O -sV -Pn -iL /BadMuffin/ScanLogs/FoundHosts > /BadMuffin/ScanLogs/Scanned
Hosts | grep -v setup_target | echo "NMAP complete" | grep -v setup_target

echo "Looking for Common Ports..."

echo "Found Ports;"

cat /BadMuffin/ScanLogs/ScannedHosts| grep -n 445
cat /BadMuffin/ScanLogs/ScannedHosts| grep -n 23
cat /BadMuffin/ScanLogs/ScannedHosts| grep -n 22
cat /BadMuffin/ScanLogs/ScannedHosts| grep -n 135
cat /BadMuffin/ScanLogs/ScannedHosts| grep -n 8080
cat /BadMuffin/ScanLogs/ScannedHosts| grep -n 3306
cat /BadMuffin/ScanLogs/ScannedHosts| grep -n 548

cp /BadMuffin/ScanLogs/ScannedHosts /BadMuffin/ScanLogs/ScannedHosts.1

cp /BadMuffin/ScanLogs/FoundHosts /BadMuffin/ScanLogs/FoundHosts.1

> /BadMuffin/ScanLogs/FoundHosts
> /BadMuffin/ScanLogs/ScannedHosts

echo "All Done, Happy Hunting!"
