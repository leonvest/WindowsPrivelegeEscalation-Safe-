# AD Risk Report — BloodHound / ACL Findings

## Scope
- Domain:
- Date:
- Data source: BloodHound graph + read-only PowerShell audit outputs

## Finding: Over-permissioned Group Control
### Observation
BloodHound indicates that <principal> has an ACL-based relationship to <group>
that can allow control over the group (e.g., WriteDACL/WriteOwner/GenericAll).

### Impact
Group control can lead to privilege expansion via transitive access.
Risk depends on what the group can access (machines, sessions, admin influence).

### Evidence
- BloodHound screenshot/path description
- `risky_group_acls.csv` rows referencing the group

### Recommendation
- Remove risky ACE(s) from non-admin principals
- Restrict who can manage the group
- Add monitoring for owner/DACL changes and membership changes

### Verification
- Re-run scripts to confirm risky ACE removal
- Re-check BloodHound path is broken
