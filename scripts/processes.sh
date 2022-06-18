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

function caller () {
  echo "
--------------------------------------------------------------------------------------

$(get_cpu_cores)

--------------------------------------------------------------------------------------

$(get_processes)

--------------------------------------------------------------------------------------

Disk space:

$(get_disk_space)

--------------------------------------------------------------------------------------

Last 5 logins:

$(get_last_login)

--------------------------------------------------------------------------------------
"
}

caller
