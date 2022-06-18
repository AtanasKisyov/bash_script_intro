Task 1:

Create three regex to match next tasks:

    • the current time in format hh:mm:ss
```shell
~$ date | grep -oE "([0-9]+:[0-9]+:[0-9]+)"
18:22:48

```

    • ipv4 address

```shell
~$ ifconfig | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
172.20.0.1
255.255.0.0
172.20.255.255
172.17.0.1
255.255.0.0
172.17.255.255
127.0.0.1
255.0.0.0
192.168.0.103
255.255.255.0
192.168.0.255


```

Task 2:


Extract from 'ps' output pids of all the processes run from the current user

```shell
~$ ps | grep -oE '[0-9]{4}'
5957
6529

```

Extract all ip addresses(ipv4 and ipv6) assigned to the host from ifconfig output. 
Present them in alphabetical order.

```shell
~$ ifconfig | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort
127.0.0.1
172.17.0.1
172.17.255.255
172.20.0.1
172.20.255.255
192.168.0.103
192.168.0.255
255.0.0.0
255.255.0.0
255.255.0.0
255.255.255.0
```

Task3:
http://www.almhuette-raith.at/apache-log/access.log 

Parse “access.log” file - find all unique IP addresses.
Group this IPs and sort them.
Calculate how much requests being made for each IP.

```shell
#!/bin/bash

connections="$(grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' result.txt | sort | uniq )"

for ip in $connections
do
  count="$(grep -oE "$ip" result.txt | wc -l)"
echo "$ip" - "$count"
done

```

Task4: 
Write a bash script to check:

    • Number of CPU Cores
    • Disk space
    • Size of RAM
    • provide information about the last users which were login on the host
    • calculate the number of active python/perl process

scripts/processes.sh
```shell
#!/bin/bash

number_of_cpu_cores=$(nproc)
disk_space=$(df)
last_login=$(last -5)
processes=$(ps | grep -oE 'Python\|Perl'| wc -l)

function get_cpu_cores () {
  echo "Count of CPU Cores: $number_of_cpu_cores"
}

get_disk_space () {
  echo "$disk_space"
}

get_last_login () {
  echo "$last_login"
}

get_processes () {

  echo "Running Python/Perl Processes: $processes"
}
```
Output:
```shell
--------------------------------------------------------------------------------------

Count of CPU Cores: 2

--------------------------------------------------------------------------------------

Running Python/Perl Processes: 0

--------------------------------------------------------------------------------------

Disk space:

Filesystem     1K-blocks     Used Available Use% Mounted on
tmpfs             801696     2188    799508   1% /run
/dev/sda3      236261580 44326508 179860868  20% /
tmpfs            4008468   217712   3790756   6% /dev/shm
tmpfs               5120        0      5120   0% /run/lock
/dev/sda1         508904   371664    137240  74% /boot/efi
/dev/sda2        4186096  3187180    998916  77% /recovery
tmpfs             801692     3668    798024   1% /run/user/1000

--------------------------------------------------------------------------------------

Last 5 logins:

atanaski :1           :1               Sat Jun 18 15:11   still logged in
reboot   system boot  5.17.5-76051705- Sat Jun 18 15:11   still running
atanaski :1           :1               Sat Jun 18 12:02 - down   (00:06)
reboot   system boot  5.17.5-76051705- Sat Jun 18 12:01 - 12:08  (00:06)
atanaski :1           :1               Sat Jun 18 11:46 - down   (00:14)

wtmp begins Sat Jan 29 14:17:18 2022

--------------------------------------------------------------------------------------

```
