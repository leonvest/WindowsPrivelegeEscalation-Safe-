# ACL Edges Explained (BloodHound mindset)

Common risky edges (high level):
- WriteOwner: can change object owner → owner can often change permissions (depending on policy)
- WriteDACL: can modify permissions (DACL) → can grant self stronger rights
- GenericAll: effectively “full control” over object
- AddMember/WriteMembers: can change group membership

Why these matter:
If a principal can gain control over a **group**, it can often influence access to machines,
sessions, or other privileged groups via transitive relationships.
Defenders should **break the chain** at the cheapest point.
