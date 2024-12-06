# CPU Rank Detector
This simple PowerShell script detects how good a CPU is using a list of desktop CPUs ranked from worst to best, and the Win32_Processor WMI object/class to detect CPU.

# Supported Models
All consumer-grade desktop and laptop CPUs up to Intel 14th gen/AMD 9000 series *should* work. 

# Running the Script
- Direct command - executes the file directly from GitHub, that way you will always have the latest version of the script. Command: `Invoke-RestMethod -Uri "https://raw.githubusercontent.com/PowerPCFan/cpu-rank-detector/refs/heads/main/CPURank.ps1" | Invoke-Expression`
- Download file - the latest version won't automatically execute, but this might be useful if you want to ensure it always runs or runs without Internet
After running the script, wait a few seconds for it to rank your CPU and then it will return a raw CPU ranking output. See below for possible outputs

# Possible Outputs:
- lowEnd - The CPU is considered low-end
- midRange - The CPU is considered mid-range
- highEnd - The CPU is considered high-end
- laptop - The CPU is an AMD laptop CPU. AMD laptop CPUs have a different output because of the confusing naming scheme, so they won't be ranked. Intel laptop CPUs should still be normally ranked.
- unknown - The CPU is unsupported/not found.

# "Can I use this in my project?" 
Yes, you can, as long as you credit me somewhere in the script or app that you used this script in.
Please include my username and profile - something like this:
"CPU Detection Script credits to @PowerPCFan on GitHub - https://github.com/PowerPCFan/cpu-rank-detector/" 
