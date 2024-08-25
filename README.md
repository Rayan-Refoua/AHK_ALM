
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

## Usage

- ALM.AppID : This must be set before the generation of a license key. It Can be anything but it should be at least 6 characters or more (Like this -> ALM.AppID := "SampleAppName v1.0")

🔴**The AppID also acts as a "Secret Key", If anyone has your AppID, He/She can easily generate license keys with the "keygen.ahk" utility.**

- generateHWID() : Generates the unique HWID of the PC based on CPU & Mainboard serial numbers
  
- generateKey() : Generates the unique software key, based on HWID (from above) and the "AppID" that has been set before executing this. (HWID will be calculated if not present from before)
  
- WriteLicense() : Writes the license to the file, next to the main script file/executable. (this will generate the valid "license key" and write it to the file)
  
- SaveKeyFile(key) : writes a "License key" to the file. (Example: User enters the received license key into the Gui of your software and it writes it as a license to file).
  
- removeLicense() : Removes the license key file from the working directory (script path), effectively removing the license from the user's PC
  

## Utilities

- KeyGen.ahk : A quick and easy license key generator. should be used as a temporary solution

## Security Considerations

**Security is a relative term**. The robustness of your software's security largely depends on the skill and determination of the individual attempting to crack it. Here are some key points to consider:

1. **End-User Platform Vulnerability**:
   - When your software runs on the end user's platform, it is inherently more vulnerable to attacks compared to software running on a remote server (like a web application). Experienced crackers can potentially reverse-engineer or manipulate the software to bypass security measures.

2. **Deterrence for Average Users**:
   - The goal of this class is to implement security measures that are strong enough to deter the average user from attempting to crack the software. By making the process complex and time-consuming, most users will find it more convenient to purchase the software legally rather than engage in illegal activities.

3. **Security Measures Implemented**:
   - **Hardware Binding**: Tying the license to specific hardware components (CPU and Mainboard serial numbers) makes it difficult for users to transfer the license to another machine.
   - **SHA-256 Encryption**: Using a strong hashing algorithm like SHA-256 for generating HW IDs and license keys ensures that the identifiers are unique and hard to forge.

4. **Potential Weaknesses**:
      - **Static Binding**: If the binding mechanism (CPU and Mainboard serial numbers) is known to the attackers, they might find ways to spoof these values.

5. **Mitigation Strategies**:
   - **Obfuscation**: Use code obfuscation techniques to make reverse-engineering more difficult.
   - **Regular Updates**: Frequently update the software to patch vulnerabilities and change the licensing mechanism periodically.
   - **Server-Side Validation**: Implement server-side checks in addition to local validation to add an extra layer of security.

### Conclusion

While no system is entirely foolproof, the measures implemented in this class aim to make it significantly challenging for the average user to crack the software. By focusing on deterrence and complexity, the system encourages users to opt for legal means of obtaining the software. However, it's important to stay vigilant and continuously improve security measures to stay ahead of potential threats.

## AutoHotkey weaknesses 

AutoHotkey (AHK) is a scripting language designed to automate the Windows GUI and general scripting. It is classified as an interpreted language, which means that its scripts are executed line-by-line by an interpreter rather than being compiled into machine code beforehand. Since AutoHotkey scripts are interpreted, they are stored in a readable format within the executable. This makes them relatively easy to unpack or decompile using various tools. such as:

1. **Resource Hacker**:
   - **Resource Hacker** is a popular tool for viewing, modifying, and extracting resources from executable files. It can be used to extract the AHK script embedded within a compiled executable.
   - Example command to extract the script:
     ```bash
     ResHacker -extract "compiled.exe", "script.ahk", rcdata,">AUTOHOTKEY SCRIPT<",1033
     ```

2. **7-Zip**:
   - **7-Zip** can open compiled AHK executables as archives. By navigating to the `RSRC` folder and then to the `rcdata` folder, you can find and extract the embedded script.
   - Steps:
     1. Right-click the executable and select "Open as Archive" using 7-Zip.
     2. Navigate to `RSRC` -> `rcdata`.
     3. Extract the file named `>AUTOHOTKEY SCRIPT<`.

3. **AHK Script Unpacker**:
   - **AHK Script Unpacker** is a dedicated tool available on GitHub for decompiling AutoHotkey scripts⁷.
   - This tool automates the process of extracting the script from the compiled executable.

### Security Implications

While these tools make it easy to unpack AHK scripts, they also highlight the importance of securing your scripts if you distribute them. Here are some strategies to protect your scripts:

1. **Obfuscation**:
   - Obfuscate your code to make it harder to read and understand. This can deter casual users from modifying or stealing your code.

2. **Encryption**:
   - Encrypt sensitive parts of your script and decrypt them at runtime. This adds an extra layer of security.
  
3. **Legal Measures**:
   - Include a clear End-User License Agreement (EULA) that prohibits reverse engineering and decompilation. While this won't stop determined attackers, it provides legal recourse.
  
## Protection tools like Themida, Enigma Protector, and WM-Protect

Software protection tools like Themida, Enigma Protector, and WM-Protect offer robust mechanisms to safeguard compiled AutoHotkey scripts from reverse engineering, tampering, and unauthorized distribution. Here's a detailed breakdown of the combined features of Themida, Enigma Protector, and WM-Protect, focusing on how they protect compiled AutoHotkey scripts:

- **Anti-Debugging**
   - **Detection Techniques**: These tools use various methods to detect if a debugger is attached to the process. This includes checking for common debugging APIs, monitoring system calls, and detecting breakpoints.
   - **Countermeasures**: Once a debugger is detected, the software can terminate itself, alter its behavior, or trigger misleading information to confuse the attacker.

- **Code Encryption**
   - **Algorithm Use**: Advanced encryption algorithms like AES (Advanced Encryption Standard) are used to encrypt the code. This ensures that even if the binary is accessed, the code remains unreadable without the correct decryption key.
   - **Runtime Decryption**: The encrypted code is decrypted in memory only when needed, minimizing the exposure of the plaintext code.

- **Virtualization**
   - **Code Virtualization**: Parts of the code are converted into a custom virtual machine language. This virtual machine executes the code, making it extremely difficult to reverse engineer since the original code is never directly executed.
   - **Dynamic Virtualization**: The virtual machine can change its behavior dynamically, adding another layer of complexity for attackers.

- **Polymorphism**
   - **Code Mutation**: Each time the software is protected, the code structure is altered without changing its functionality. This makes it difficult for pattern-based attacks to succeed.
   - **Unique Signatures**: By constantly changing the code's signature, it becomes harder for antivirus and reverse engineering tools to recognize and analyze the protected software.

-  **Code Obfuscation**
   - **Control Flow Obfuscation**: The logical flow of the program is altered, making it difficult to follow the code's execution path.
   - **Name Obfuscation**: Variable, function, and class names are replaced with meaningless names, making the code harder to understand.

- **Anti-Tampering**
   - **Integrity Checks**: The software periodically checks its own integrity by verifying checksums or hashes of its code and data. If any unauthorized changes are detected, the software can take corrective actions.
   - **Self-Repair**: Some tools can repair tampered code by restoring it from a secure backup.


- **Integrity Checks**
   - **File Integrity Monitoring**: The software monitors its files for unauthorized changes. This includes checking for modifications, deletions, or additions.
   - **Memory Integrity**: The software can also monitor its memory space to detect and prevent tampering at runtime.


## Acknowledgements
Thanks to [TheArkive](https://github.com/TheArkive)
 - [CLSAK_AHK](https://github.com/TheArkive/CLSAK_AHK)
 - [BcryptHash_ahk2](https://github.com/TheArkive/BcryptHash_ahk2)
