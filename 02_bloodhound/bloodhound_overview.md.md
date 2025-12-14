# BloodHound Overview: How It Works and What It Reveals

This section explains what BloodHound is, how it models Active Directory,
and why it is effective at identifying privilege escalation risk.

The focus is on **understanding and defense**, not exploitation.

---

## What is BloodHound?

BloodHound is a security analysis tool designed to help defenders and
security professionals understand **permission relationships in Active Directory (AD)**.

Instead of looking at AD as isolated users, groups, and computers,
BloodHound treats the environment as a **graph of relationships**.

Each relationship represents a way one object can **influence** another.

---

## The Graph-Based Model (Core Idea)

BloodHound models Active Directory as:

- **Nodes**  
  Objects such as:
  - Users
  - Groups
  - Computers
  - Service accounts
  - Domains

- **Edges**  
  Relationships that describe **capabilities or influence**, such as:
  - Membership
  - Administrative rights
  - Delegation
  - Permission-based control (ACLs)

An **attack path** is simply a path through this graph from a
low-privilege node to a high-value node.

---

## Why Graph Analysis Matters

In real environments:
- Privilege is rarely granted directly
- Risk emerges from **chains of small permissions**
- Manual review misses transitive relationships

BloodHound automatically:
- Follows transitive group memberships
- Interprets ACL permissions
- Combines relationships across users, groups, and computers

This makes **non-obvious privilege escalation paths visible**.

---

## What BloodHound Does *Not* Do

BloodHound:
- Does not exploit vulnerabilities
- Does not perform attacks
- Does not grant access by itself

It only **models what is already possible** based on existing configuration.

If BloodHound shows a path, that path exists due to **design or misconfiguration**.

---

## What BloodHound Showed in the Lab (Conceptual)

In the lab environment, BloodHound revealed that:

- A non-administrative identity had **excessive permissions**
- Those permissions implied **control over a directory object**
- The controlled object (a group) had **meaningful privileges**
- This created a **valid escalation path** without exploiting software bugs

Importantly:
- No malware was required
- No code execution vulnerabilities were involved
- The risk came entirely from **directory permissions and trust**

---

## Why This Is Dangerous in Practice

ACL-based escalation paths are especially risky because:

- They are quiet and persistent
- They often survive audits and role changes
- They rely on “legitimate” AD features
- They are hard to reason about without tooling

Many real-world breaches escalate privileges through **identity and permissions**, not exploits.

---

## Defensive Value of BloodHound

From a defensive standpoint, BloodHound helps to:

- Identify over-permissioned accounts
- Reduce unnecessary delegation
- Break privilege chains at low cost
- Validate whether hardening actually removed risk

It is most effective when used **proactively**, not only after incidents.

---

## Key Takeaway

> BloodHound does not create privilege escalation —  
> it reveals where privilege escalation is already possible.

Understanding and fixing these paths is one of the most impactful
ways to improve Active Directory security.
