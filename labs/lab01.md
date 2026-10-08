# Lab 01: Your First VPC

> Create a single VPC with OpenTofu, and learn the basic workflow by watching what it does.

**AWS topic:** VPC basics
**Cost:** free

---

## Build

- A project that uses the **AWS provider**, pinned to a version range you choose
- The provider authenticates with a **named AWS CLI profile**, written explicitly in the code (never access keys)
- One **VPC**:
  - CIDR `10.0.0.0/16`
  - DNS hostnames enabled
  - a `Name` tag
- Every resource the project creates gets these tags **automatically**, without repeating them on each resource:
  - `Project = tofu-labs`
  - `ManagedBy = opentofu`
- A `.gitignore`, please check the repo's `.gitignore` to see what shouldn't be commited, feel free to search on why these files are there!

---

## Done when

- `plan` shows exactly one VPC to create
- After `apply`, the VPC appears in the console with **3 tags**
- Running `apply` a second time changes nothing

---

## Explore

Answer these by experimenting, not by searching for the answer:

1. Some values in the plan say `(known after apply)`. Why can't OpenTofu know them yet?
2. Open the state file (read it, never edit it). Find your VPC. What's the difference between `tags` and `tags_all`?
3. Rename the VPC in the console, then run `plan`. What does OpenTofu want to do?
4. Add a tag in the console that isn't in your code, then run `plan`. Is it kept or removed?
5. Change the VPC's CIDR in code and run `plan` (don't apply). How is this plan different from the tag change? Why?
6. Should `.terraform.lock.hcl` be committed or ignored? Defend your answer.

---

## Clean up

`destroy` everything. Then look at the state file one more time: what's left inside it?
