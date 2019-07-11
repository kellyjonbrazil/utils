#!/bin/bash
# Connect to a virtual serial port via named pipe on a VM
# Requires socat

# Add the following lines to the vmx file:
# serial0.present = "TRUE"
# serial0.fileType = "pipe"
# serial0.pipe.endPoint = "server"
# serial0.yieldOnMsrRead = "TRUE"
# serial0.startConnected = "TRUE"
# serial0.fileName = "/tmp/serial”

serialPort="/tmp/serial"
sudo rm $0.log
echo "Connecting to $serialPort..."
sudo socat -d -d -lf $0.log $serialPort PTY &

echo "Getting port..."
sleep 3

ttyPort=$(grep "PTY is" $0.log | cut -f 7 -d " ")

if [[ $ttyPort == "" ]]; then
  echo "Couldn't get a PTY"
  echo
  cat $0.log
  exit 1
fi

echo "Using port $ttyPort"
echo
sleep 1

# Use any terminal program you like:
# sudo screen -U $ttyPort 115200
sudo picocom -b115200 $ttyPort
