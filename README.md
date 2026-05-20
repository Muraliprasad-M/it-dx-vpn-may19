# AWS Direct Connect HA (Terraform)

## 📌 Overview

This Terraform configuration provisions a **High Availability (HA) AWS Direct Connect setup** integrated with a **Transit Gateway (TGW)** in a **Control Tower Network Account (Hub)**.

It enables **resilient, private connectivity** between **on-premises data centers** and AWS using:

- ✅ 2 Direct Connect connections (multi-location HA)
- ✅ 2 Transit Virtual Interfaces (VIFs)
- ✅ 1 Direct Connect Gateway (DXGW)
- ✅ Existing Transit Gateway (TGW)

---

## 🧭 Architecture

On-Prem DC
│
├── DX Connection 1 (Location A)
│       │
│   Transit VIF 1
│
├── DX Connection 2 (Location B)
│       │
│   Transit VIF 2
│
▼
Direct Connect Gateway (DXGW)
│
▼
Transit Gateway (TGW) - Network Account
│
▼
Inspection VPC (Firewall)
│
▼
Spoke VPCs (Prod Account)

## ✅ Features

- High availability using **dual DX connections**
- Integrated with **Transit Gateway (hub-and-spoke)**
- Fully compatible with **AWS Control Tower landing zone**
- Supports **Active/Active or Active/Passive BGP routing**
- Terraform-based deployment (Infrastructure as Code)

---

## 📁 Project Structure


.
├── providers.tf
├── variables.tf
├── main.tf
├── outputs.tf
└── terraform.tfvars

---

## ⚙️ Prerequisites

- AWS Direct Connect connections provisioned (`dxcon-*`)
- Transit Gateway already deployed in Network Account
- AWS Control Tower setup with:
  - `AWSControlTowerExecution` role
- Terraform >= 1.3
- AWS Provider ~> 5.0

---

## 🔧 Configuration

Update `terraform.tfvars`:

```hcl
network_account_role = "arn:aws:iam::<network-account-id>:role/AWSControlTowerExecution"

tgw_id = "tgw-xxxxxxxx"

dx_connection_ids = [
  "dxcon-aaaa1111",
  "dxcon-bbbb2222"
]

vlans = [101, 102]

onprem_bgp_asn = 65010

amazon_ips = [
  "169.254.100.1/30",
  "169.254.101.1/30"
]

customer_ips = [
  "169.254.100.2/30",
  "169.254.101.2/30"
]
