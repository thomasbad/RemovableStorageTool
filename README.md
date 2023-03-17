# RemovableStorageTool
A tool to disable/enable removable storage access on the local PC

## Use Tips:
1. Disable / Enable all removable storage function will override all other options.
2. If you not sure how the setting mess up already after many changes, just reset it back to Windows default first.
3. The PC needs to reboot once to make the change apply on PC

## How to Use
1. Make sure you run this program with "Run as admin", if the program cannot get the admin right itself.
2. If you use it on the domain group policy controlled PC for temporary unlock the USB drive access, you may:
  a. First, unplug or disable the network
  b. Use this program to disable the stuff, reboot the PC to apply the change
  c. Now you may enable the network and do you stuff
  d. Reset the setting back to windows default one, update the group policy and restart the PC

There is a GUI and CLI version for use. Compatible with Windows Vista or above.

![image](https://user-images.githubusercontent.com/20796385/225828052-58e0e803-e3e9-4962-9670-c3a2ef655c7e.png)
![image](https://user-images.githubusercontent.com/20796385/225839554-e90adc91-bcf3-4939-a0d1-27f07218a634.png)

