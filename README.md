#Work in progress

# RemovableStorageTool
A tool to disable/enable removable storage access on the local PC
Disable / Enable all removable storage function will override all other options.
If you not sure how the setting mess up already after many changes, just reset it back to Windows default first.

The PC needs to reboot once to make the change apply on PC, if you need to use it on a domain manged PC, you may unplug the network from the PC, use it until it is fully reboot to apply the change, then you can get the network back with the access temporary enabled. Remember run "gpupdate" and reboot to lock it back after use.

There is a GUI and CLI version for use. Compatiable with Windows Vista or above.
