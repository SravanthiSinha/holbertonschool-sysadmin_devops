#!/bin/bash

##################################################
#The bash script takes  3 parameters:            #
#the message that the AI will say                #
#the sex of the AI voice                         #
#the server IP where the message will be served  #
##################################################

message=$1
sex_AI=$2
server_IP=$3

#Uses the first word of the message as a filename for the message file 
filename=$(echo $1|awk '{print $1}').m4a
echo $filename

#Choose the name of the voice to be used depending on the passed parameter 
case $sex_AI in
    "f")
	voice="Victoria"
	;;
    "m")
	voice="Bruce"
	;;
    "x")
	voice="Zarvox"
	;;
esac

#Create a voice message file (format m4a) that says the passed message
say -v $voice -o $filename $message

#Upload this voice message to your web server
serverpath='admin@'$3':/var/www/twitter_clone-DA-SS.com/twitter_clone-DA-SS'

scp -q  $filename  $serverpath

#Display a message explaining where to listen the message
echo 'Listen to the message on http://'$server_IP'/'$filename
