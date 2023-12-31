
![Logo](https://raw.githubusercontent.com/Rayan-Refoua/AHK_ALM/main/Logo.png)


# ALM (AutoHotkey License Manager)

ALM is a hardware-locked licensing toolkit for AutoHotkey v2, It uses Mainboard and CPU serial number as a hardware fingerprint and generates a license key from it. The license key is embedded in the script directory and verified at runtime against the current hardware fingerprint. If they mismatch, the software gets blocked from execution.


## Features

- Binds to CPU and Mainboard serial number
- Generated license key is valid across Windows installations on the same PC
- Uses SH-256 for both "HW ID" (Hardware ID) and "CPU ID" encryption.
- Fast Response (Usually under 1 second to validate license key)
- Saves License as a local file next to your script (No additional files or registry keys are needed.)
- Keygen included (Generate license keys in seconds for your clients)
- Differentiate between multiple software by unique "App ID" so with one HWID, each "License Key" would work only for the designated software.



## FAQ

#### How secure is it?

Security is a relative term. it depends on who wants to crack your Software, as long as your software is running in the end user platform, and not on a remote server (such as a web application) it is possible to be done by an experienced cracker. However, with this class, I aim to fool-proof the system so the average end user would rather pay for the software instead of turning to illegal actions.


## Acknowledgements
Thanks to [TheArkive](https://github.com/TheArkive)
 - [CLSAK_AHK](https://github.com/TheArkive/CLSAK_AHK)
 - [BcryptHash_ahk2](https://github.com/TheArkive/BcryptHash_ahk2)
