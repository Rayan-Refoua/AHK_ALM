
![Logo](https://raw.githubusercontent.com/Rayan-Refoua/AHK_ALM/main/Logo.png)


# ALM (AutoHotkey License Manager)

ALM is a hardware-locked licensing toolkit for AutoHotkey v2, It uses the Mainboard and CPU serial number as a hardware fingerprint and generates a license key from it. The license key is embedded in the script directory and verified at runtime against the current hardware fingerprint. If they mismatch, the software gets blocked from execution.


## Features

- Binds to CPU and Mainboard serial number
- Generated license key is valid across Windows installations on the same PC
- Uses SH-256 for both "HW ID" (Hardware ID) and "CPU ID" encryption.
- Fast Response (Usually under 1 second to validate license key)
- Saves License as a local file next to your script (No additional files or registry keys are needed.)
- Keygen included (Generate license keys in seconds for your clients)
- Differentiate between multiple software by unique "App ID" so with one HWID, each "License Key" would work only for the designated software.

## Useage

- ALM.AppID : This must be set before the generation of a license key. It Can be anything but it should be at least 6 characters or more (Like this -> ALM.AppID := "SampleAppName v1.0")

🔴**The AppID also acts as a "Secret Key", If anyone has your AppID, He/She can easily generate license keys with the "keygen.ahk" utility.**

- generateHWID() : Generates the unique HWID of the PC based on CPU & Mainboard serial numbers
  
- generateKey() : Generates the unique software key, based on HWID (from above) and the "AppID" that has been set before executing this. (HWID will be calculated if not present from before)
  
- WriteLicense() : Writes the license to the file, next to the main script file/executable. (this will generate the valid "license key" and write it to the file)
  
- SaveKeyFile(key) : writes a "License key" to the file. (Example: User enters the received license key into the Gui of your software and it writes it as a license to file).
  
- removeLicense() : Removes the license key file from the working directory (script path), effectively removing the license from the user's PC
  

## Utilities

- KeyGen.ahk : A quick and easy license key generator. should be used as a temporary solution

## FAQ

#### How secure is it?

Security is a relative term. it depends on who wants to crack your Software, as long as your software is running in the end user platform, and not on a remote server (such as a web application) it is possible to be done by an experienced cracker. However, with this class, I aim to fool-proof the system so that the average end user would rather pay for the software instead of committing illegal actions.


## Acknowledgements
Thanks to [TheArkive](https://github.com/TheArkive)
 - [CLSAK_AHK](https://github.com/TheArkive/CLSAK_AHK)
 - [BcryptHash_ahk2](https://github.com/TheArkive/BcryptHash_ahk2)
