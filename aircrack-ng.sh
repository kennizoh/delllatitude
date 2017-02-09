#! /bin/bash
if [ $USER = "root" ]
then
 echo "starting processes. please wait..."

 echo "checking for wireless card available"

 airmon-ng

 echo "checking for processes that could interfere with aircrack-ng"

 airmon-ng check

 echo "killing interfering processes.."

 airmon-ng check kill

 echo "enter the name of your wifi card: "

 read realinterface

 echo "enabling monitor mode.."

 airmon-ng start $realinterface

 echo "enter the name of your monitoring interface: "

 read monitorinterface

 echo "checking for available wifi signals.."
 echo "hold ctrl and press when you find the desired network and copy-paste the bssid under the prompt"
 airodump-ng $monitorinterface

 echo "enter the maccaddress of the router below: "

 read macaddress

 echo "targeting the selected network"

 airodump-ng --bssid $macaddress $monitorinterface

 echo "finishing the process"

  [ while [ $x != 1 ]
   echo "the inteface to stop"
   airmon-ng stop $monitorinterface
   echo "if there is a monitoring interface running, kill it. when done enter 1 to quit this loop"
   airmon-ng
   read monitorinterface ]
 airmon-ng stop $realinterface

 service network-manager restart
 echo "all done now, how was your experience, did you obtain your desired experience?"

 #read userresponse
 #touch /home/ken/Desktop/response.txt
 #cat response.txt < $userresponse
else
 echo "You must run this script as root for it to work correctly"

fi
