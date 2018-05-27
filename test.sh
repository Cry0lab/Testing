#!/bin/bash
echo "Enter something: "
read IP
isAlive() #Takes an IP Address and sees if it is alive or not
{
A=$(ping -c 4 $1 | grep Unreach | wc -l )
if [ "$A" != "0" ]; then
 echo "0" #ip is available
else
 echo "1" #Ip is alive
fi
}

{
I=$IP

#if [ "$(ipcalc -cs $I && echo 1 || echo 0)" == 0 ]; then
#echo "That is not a valid IP Address. Please enter a valid IP Address:"
#read IP
#validIP
#return 0
#fi

if [[ "$ip" =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$ ]]; then
  echo "failure"
  read IP
  validIP
  return 0
fi

if [ "$(isAlive $I)" == "1" ] && [ "$I" != "$DHCP_IP" ]; then
 echo "That IP ADDRESS is already in use. Please enter a different one:"
 read IP
 validIP
 return 0
fi


}

validIP
