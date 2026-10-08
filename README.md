# tofu-labs

![OpenTofu](https://img.shields.io/badge/OpenTofu-1.12-FFDA18?logo=opentofu&logoColor=black)
![AWS](https://img.shields.io/badge/AWS-eu--north--1-FF9900?logo=amazonwebservices&logoColor=white)

Hands-on **Infrastructure as Code** labs with [OpenTofu](https://opentofu.org), built alongside my
**AWS Solutions Architect – Associate (SAA)** studies.

> Two birds, one stone: every AWS concept I learn in the console, I rebuild here as code.

---

## 🚀 Learning with this repo? Start here

This repo doubles as a **free, hands-on path** for learning OpenTofu on AWS.

1. Open [`labs/lab01.md`](labs/lab01.md). Each brief tells you **what** to build, never **how**
2. Write the code yourself, using the [OpenTofu docs](https://opentofu.org/docs/) and the AWS provider docs
3. Work through the **Explore** questions by experimenting, not by searching for the answers
4. Stuck? Only then compare with the code on the matching `lab-XX` branch / merged PR
5. `destroy` everything, then move on to the next lab

> The struggle is the point: searching, failing and fixing is how the concepts stick.

**You'll need:** an AWS account (use an IAM user, never root), the AWS CLI with a named profile, and OpenTofu installed. Every lab so far costs **$0** as long as you `destroy` at the end.

---

## How each lab works

1. Learn the concept and build it by hand in the **AWS console**
2. Rebuild it with **OpenTofu**: `init` → `plan` → `apply`
3. Run experiments: drift, replacements, failure cases
4. `destroy` everything, then merge the lab branch into `main` through a PR

---

## Labs

| # | Topic | Status |
|---|---|---|
| [01](labs/lab01.md) | VPC, provider setup, default tags | ✅ Done |
| [02](labs/lab02.md) | Subnets, network module, outputs | ✅ Done |
| [03](labs/lab03.md) | Internet Gateway, route tables, public / private subnets | ⏳ In progress |
| 04 | Data sources, default VPC, Elastic IP | 🔜 Planned |
| 05 | NAT Gateway | 🔜 Planned |
| 06 | Security Groups, NACLs, EC2 | 🔜 Planned |

---

## Project structure

```
tofu-labs/
├── main.tofu          # calls the modules
├── provider.tofu      # terraform {} + provider "aws" {}
├── variables.tofu     # root locals (common tags)
├── outputs.tofu       # values printed after apply
├── labs/              # 📘 lab briefs: what to build, no solutions
│   ├── lab01.md
│   ├── lab02.md
│   └── lab03.md
└── network/           # network module
    ├── vpc.tofu
    ├── subnet.tofu
    ├── variables.tofu
    └── outputs.tofu
```

- `labs/` holds the **briefs** (the exercises)
- everything else is **my solution**, built up one lab at a time

---

## Running it

**Requirements:** OpenTofu, AWS CLI, an AWS profile with permissions to create VPC resources

```bash
tofu init
tofu plan
tofu apply
tofu destroy   # always clean up after a lab
```

> **Note:** the provider uses the AWS profile `coco-default`.
> Change `profile` in `provider.tofu` to your own profile before running.

---

## Rules I follow

- No credentials in code. Authentication comes from an AWS CLI profile
- State files (`*.tfstate`) are never committed
- `.terraform.lock.hcl` **is** committed, so provider versions stay pinned
- Every resource is tagged `Project = tofu-labs` and `ManagedBy = opentofu`