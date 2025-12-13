# Case Study: “HelpDesk group control” path (Safe)

## What happened (conceptually)
A non-admin identity had permissions that implied potential control over the HelpDesk group
via ACL-related rights (e.g., WriteOwner/WriteDACL/GenericAll).

## Why it matters
If HelpDesk has access to privileged systems or delegated admin tasks, controlling it can
become a stepping stone toward higher privilege.

## Defensive actions
- Identify which ACE grants the risky edge (read-only script output)
- Remove or narrow the ACE using approved change control
- Validate: path disappears in BloodHound + audit script no longer flags it
