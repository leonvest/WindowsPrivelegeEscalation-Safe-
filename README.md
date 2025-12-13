

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

Educational and Defensive Use Only

##

This repository is provided solely for educational, academic, and defensive security purposes, such as learning how to analyze Active Directory privilege relationships and reduce privilege-escalation risk using BloodHound.

All techniques, explanations, and scripts included are read-only and are intended to be used only in environments you own or have explicit authorization to assess.

This repository does not provide exploitation workflows or operational guidance for gaining unauthorized access. Any misuse of the information, including actions that violate laws, organizational policies, or terms of service, is strictly prohibited.

The authors assume no responsibility or liability for any misuse, damage, or legal consequences resulting from the use of this material. Responsibility for ethical and lawful use lies entirely with the user.
