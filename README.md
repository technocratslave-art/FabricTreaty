# FabricTreaty

FabricTreaty defines an operating-system protocol for **deterministic compute** by enforcing
**instruction jurisdiction**, **scheduler authority**, and **memory integrity**.

It documents how to turn a general-purpose OS into an **appliance-grade execution environment**
using existing kernel and systemd primitives.  
AI workloads are a validating use case — **not the scope**.

---

## What This Is

FabricTreaty is a **policy and enforcement framework**, not a driver, kernel fork, or AI runtime.

It answers one question:

> *Who has authority over execution on modern, coprocessor-heavy systems?*

Modern SoCs increasingly rely on opaque accelerators, firmware schedulers, and background
services that introduce latency, jitter, and thermal instability. FabricTreaty restores
determinism by enforcing control at the OS boundary.

---

## Core Principles

### 1. Instruction Jurisdiction
Only compute whose instruction surface is directly owned by the local kernel
can be treated as sovereign.

- CPU instruction extensions (AMX / AVX / SVE) qualify.
- Brokered or signed accelerators do not.

### 2. Scheduler Authority
Deterministic execution requires explicit scheduler control.

- Real-time scheduling where appropriate
- Core pinning on asymmetric architectures
- Elimination of fairness-based jitter

### 3. Memory Integrity
Critical working sets must be immune to swap and reclamation.

- Locked memory for bounded execution pools
- Clear separation from general-purpose workloads

---

## Why AI Shows the Problem Clearly

AI inference is **not special** — it is simply sensitive.

Large models amplify:
- latency from scheduler noise
- thermal instability
- memory contention
- background service interference

FabricTreaty applies equally to:
- control systems
- media pipelines
- DSP
- robotics
- simulation
- finance workloads

AI makes the failure modes obvious; it does not define the protocol.

---

## Reference Implementation

FabricTreaty includes a **reference implementation** validated on:

- Apple Silicon (M1–M3)
- Fedora Asahi Remix (early 2026)

This environment is used because it exhibits:
- asymmetric cores
- heavy coprocessor mediation
- tight thermal margins

Apple hardware is **not the target** — it is a proving ground.

---

## What This Repo Contains

- `docs/`  
  Instruction Jurisdiction doctrine and design notes

- `profiles/`  
  Opt-in systemd targets for deterministic operation

- `services/`  
  Hardened service units enforcing scheduler and memory policy

- `scripts/`  
  Minimal helpers for applying enforcement cleanly

---

## What This Is Not

- Not an AI framework
- Not a kernel modification
- Not a hardware exploit
- Not a vendor-specific hack
- Not a performance benchmark project

FabricTreaty uses **documented OS mechanisms** to enforce existing guarantees.

---

## License

Apache License 2.0

This project defines policy and reference configuration.
It intentionally avoids kernel code or firmware interaction.

---

## Status

- Doctrine: Stable
- Reference implementation: Validated
- Scope: General-purpose OS determinism
