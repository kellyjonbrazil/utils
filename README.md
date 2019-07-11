# utils
Helpful tools and utility scripts

## vmserial.sh
This bash script allows you to easily connect to a named pipe serial console on a VM through your terminal on your Mac. `socat` is required (`brew install socat`) and you can use the built-in `screen` or another terminal emulator like `picocom`. Modify the path to the named pipe in the script and you can replicate for multiple VMs.

To configure the virtual serial console on your VM, add the following or similar configuration to your .vmx or other VM definition file:

```
serial0.present = "TRUE"
serial0.fileType = "pipe"
serial0.pipe.endPoint = "server"
serial0.yieldOnMsrRead = "TRUE"
serial0.startConnected = "TRUE"
serial0.fileName = "/tmp/serial”
```

