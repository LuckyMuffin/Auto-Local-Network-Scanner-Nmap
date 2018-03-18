#Windows blocking ICMP traffic? Just use ARP!

#!/bin/bash
> /ScanLogs/FoundHosts
> /ScanLogs/ScannedHosts

arp-scan --localnet --numeric --quiet --ignoredups | awk '{print $1}' | grep -v 
Starting | grep -v Interface | grep -v packets | grep -v Ending | grep -v respon
ded | grep -v "arp-scan" >> /BadMuffin/ScanLogs/FoundHosts | echo "Arp Scan Comp
lete... Starting NMAP"

nmap -O -sV -Pn -iL /BadMuffin/ScanLogs/FoundHosts > /BadMuffin/ScanLogs/Scanned
Hosts | grep -v setup_target | echo "NMAP complete" | grep -v setup_target

echo "Looking for Common Ports..."

echo "Found Ports;"

grep -n 445 /ScanLogs/ScannedHost
grep -n 23 /ScanLogs/ScannedHost
grep -n 22 /ScanLogs/ScannedHost
grep -n 135 /ScanLogs/ScannedHost
grep -n 8080 /ScanLogs/ScannedHost
grep -n 3306 /ScanLogs/ScannedHost
grep -n 548 /ScanLogs/ScannedHost

cp /ScanLogs/ScannedHosts /ScanLogs/ScannedHosts.1

cp /ScanLogs/FoundHosts /ScanLogs/FoundHosts.1

> /BadMuffin/ScanLogs/FoundHosts
> /BadMuffin/ScanLogs/ScannedHosts

echo "All Done, Happy Hunting!"
