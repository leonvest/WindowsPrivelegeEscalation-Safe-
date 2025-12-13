# Breaking an Attack Path (defensive)

When BloodHound shows a path like:

Low-priv principal
  → (ACL edge on group)
  → Group control
  → High value target

Defensive breakpoints (examples):
1) Remove/limit WriteDACL / WriteOwner / GenericAll from non-admin principals
2) Move sensitive groups to protected OUs with stricter delegation
3) Minimize nested groups that bridge low privilege into admin influence
4) Add monitoring for:
   - owner changes
   - ACL changes
   - group membership changes
