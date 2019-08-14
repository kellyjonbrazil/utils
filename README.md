# utils
Helpful tools and utility scripts

## vmserial.sh
This bash script allows you to easily connect to a named pipe serial console on a VM through your terminal on your Mac. `socat` is required (`brew install socat`) and you can use the built-in `screen` or another terminal emulator like `picocom`. Modify the `serialPort` variable with the path to the named pipe in the script. You can replicate the script for multiple VMs.

To configure the virtual serial console on your VM, add the following or similar configuration to your .vmx or other VM definition file:

```
serial0.present = "TRUE"
serial0.fileType = "pipe"
serial0.pipe.endPoint = "server"
serial0.yieldOnMsrRead = "TRUE"
serial0.startConnected = "TRUE"
serial0.fileName = "/tmp/serial"
```

## resizeterm.sh
Useful to have in the home directory or path when using vmserial (above) or real serial interfaces when logging into appliances. Allows terminal applications to display using whatever arbitrary terminal size you have set for your window.

## wwwhostip.py
This is a simple python web server that will output the server's hostname and local IP address. This tool is good for testing load balancing (e.g. on k8s ingress, AWS ELB, etc.) to demonstrate that multiple web servers are responding.

Sample request and response:

```
$ curl localhost
hostname: www.test.com   ip: 192.168.1.221
```
