# Case Study: “HelpDesk group control” path (Safe)

## What happened (conceptually)
A non-admin identity had permissions that implied potential control over the HelpDesk group
via ACL-related rights (e.g., WriteOwner/WriteDACL/GenericAll).

## Why it matters
If HelpDesk has access to privileged systems or delegated admin tasks, controlling it can
become a stepping stone toward higher privilege.
# Case Study: ACL-Based Privilege Escalation Path (Sanitized)

This case study describes an **Active Directory privilege escalation path**
identified and analyzed using BloodHound in a controlled lab environment.

The focus is on **principles, techniques, and defensive lessons**, not on
operational exploitation steps.

---

## Scenario Overview

During analysis of an Active Directory environment, BloodHound revealed a
privilege escalation path originating from a **non-administrative identity**
and ending at a **high-privilege security context**.

The path was not based on software vulnerabilities or exploits, but on
**directory permissions and trust relationships**.

---

## High-Level Attack Chain (Conceptual)

At a high level, the following chain existed:

1) A low-privilege principal had **excessive permissions** over an AD object  
2) Those permissions implied **control over a group**
3) The group had **meaningful privileges** within the domain
4) Group control enabled **indirect privilege escalation**

No credential theft or code execution was required.

---

## Key Techniques Involved (Conceptual)

### 1) Abuse of Directory Permissions (ACLs)

BloodHound highlighted that a principal had rights equivalent to:
- the ability to influence ownership or permissions of an object, or
- broad control over a directory object

These permissions are often overlooked because they do not look like
“administrator access” at first glance.

**Key insight:**  
> In Active Directory, *permissions are power*.

---

### 2) Group Control as a Privilege Boundary

Once control over a group is obtained, the group itself becomes the privilege
boundary.

If a group:
- has delegated administrative capabilities, or
- grants access to sensitive systems, or
- is nested into other privileged groups,

then controlling the group enables escalation **without touching Domain Admins directly**.

---

### 3) Indirect Escalation via Trust Relationships

The escalation path relied on:
- transitive trust
- group nesting
- delegated responsibilities

This demonstrates how **small misconfigurations compound** into serious risk.

---

## Why BloodHound Was Critical

This path would have been extremely difficult to identify manually.

BloodHound made it visible by:
- modeling permissions as graph edges
- revealing shortest paths to high-value targets
- exposing non-obvious relationships between objects

**Without graph analysis, this risk would likely remain undetected.**

---

## Why This Is Dangerous in Real Environments

- ACL misconfigurations persist silently
- Service accounts and legacy roles are often over-permissioned
- The path requires no malware, exploits, or noisy behavior
- Changes may blend in with legitimate administrative activity

---

## Defensive Lessons Learned


### 1) ACLs Must Be Treated as Privileged

Permissions such as:
- WriteOwner
- WriteDACL
- GenericAll
- Group membership modification

should be treated with the same caution as administrator rights.

---

### 2) Group Ownership and Delegation Must Be Controlled

Groups that:
- influence access to systems,
- grant operational authority, or
- act as intermediaries for administration

must have:
- clearly defined ownership
- tightly scoped delegation
- regular permission review

---

### 3) Reduce Attack Paths, Not Just Accounts

Removing a single user from a group is not sufficient.

Effective defense focuses on:
- breaking privilege chains
- removing unnecessary delegation
- simplifying trust relationships

---

## Key Takeaway

> This case study demonstrates that **privilege escalation in Active Directory
> is often a design failure, not a technical exploit**.
