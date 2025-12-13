# WindowsPrivelegeEscalation-Safe-

# 🛡️ AD Privilege Escalation Risk Analysis (BloodHound) — SAFE

This repository teaches how to **identify and reduce** Active Directory privilege-escalation risk
using BloodHound and **read-only** auditing scripts.

## What this repo teaches
- How BloodHound represents attack paths (graph mindset)
- Why **ACL edges** like WriteOwner / WriteDACL / GenericAll are dangerous
- How to find risky permissions in AD with PowerShell (read-only)
- How to write remediation guidance that breaks paths

## What this repo does NOT do
- No exploitation playbooks
- No commands that change AD permissions/owners
- No “add user to group” workflows
- No RDP / lateral movement steps

## Quick start (read-only)
Run the scripts in `03_detection_scripts/` to generate a findings report.
Then use the modules in `02_bloodhound/` to interpret and propose remediations.

