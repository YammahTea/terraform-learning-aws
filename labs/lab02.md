# Lab 02: Subnets

> Add subnets to your VPC, and move your network code into its own module.

**AWS topic:** subnets, Availability Zones
**Cost:** free
**Starts from:** your Lab 01 code

---

## Build

- Move the VPC into a **network module** that your root configuration calls
- Two subnets inside the VPC:

| Subnet | CIDR | AZ | Auto-assign public IPv4 |
|---|---|---|---|
| public | `10.0.1.0/24` | first AZ of your region | yes |
| private | `10.0.2.0/24` | second AZ of your region | no |

- **Naming:** don't call them `a` and `b`. Pick a naming convention so that a subnet's name alone tells you **which AZ** it's in and whether it's **public or private**, then apply it to every subnet.
  - For inspiration, see [AWS naming conventions](https://cjrequena.com/2020-06-05/aws-naming-conventions-en), which uses the pattern `subnet-{Region}-{AZ}-{public|private}-{Env}-{App}`
  - Keep only the parts that are useful for *your* project
  - **Bonus:** make OpenTofu **reject** any subnet whose name breaks your convention, before anything is created
- Both subnets come from **one single resource definition**: no copy-paste, and no per-subnet `if` logic
- Adding a third subnet should only mean adding its **data**, not changing any logic
- No hard-coded VPC ID anywhere
- After `apply`, the terminal prints the VPC ID and every subnet's ID, and it's clear which ID belongs to which subnet

---

## Done when

- `apply` creates 1 VPC + 2 subnets, and prints the IDs at the end
- The common tags from Lab 01 are on every resource
- Adding a third subnet is a one-entry change

---

## Explore

1. In the `apply` output, what was created first? How did OpenTofu know the order when you never told it?
2. Use the state commands to list your resources and show one subnet. How is each subnet addressed?
3. Remove the public subnet from your code and run `plan`. What happens to the private one?
4. What would the same change do if the subnets were indexed by **number** instead? Test it.
5. Give the public subnet a CIDR **outside** the VPC's range. Does `plan` catch it? Does `apply`? Who reports the error?
6. After a failed `apply`, check what still exists. Does OpenTofu undo the steps that already happened?
7. Rename your module while the resources exist, then run `plan`. What does it want to do? How can you avoid that?

---

## Clean up

`destroy` everything.
