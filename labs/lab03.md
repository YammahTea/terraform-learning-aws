# Lab 03: Public and Private Subnets

> Give your VPC a way to reach the internet, and make one subnet truly public and the other truly private.

**AWS topic:** Internet Gateway, route tables, public vs private subnets
**Cost:** free
**Starts from:** your Lab 02 code

---

## Build

All of this goes inside your network module:

- An **Internet Gateway** attached to the VPC
- A **public route table** with a route to the internet through the Internet Gateway
- A **private route table** with no route to the internet
- Every subnet is associated with the correct route table, based on its **data**, not on hard-coded subnet names
- **One source of truth:** a single field in each subnet's data decides whether it is public, and that same field controls both:
  - auto-assign public IPv4
  - which route table the subnet gets
- The VPC's **main** route table is left without an internet route
- Root outputs: the Internet Gateway ID and the route table IDs

---

## Done when

- The VPC's **Resource map** in the console shows each subnet connected to the right route table, and only the public one leads to the Internet Gateway
- Adding a new public subnet is a one-entry change, and it gets the public route table automatically

---

## Explore

1. Remove one subnet's route table association and apply. Which route table does that subnet use now?
2. Why is it risky to put the internet route in the main route table?
3. A route can be written inside the route table, or as a separate resource. What do the docs say about mixing both styles?
4. In the console, add an internet route to the **private** route table by hand, then run `plan`. Does OpenTofu notice? Would the answer change with the other route style?
5. Run `destroy` and watch the order. What has to be removed before the VPC can be deleted?

---

## Clean up

`destroy` everything.
