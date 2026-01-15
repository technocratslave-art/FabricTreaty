# Apple Silicon M1 — Reference Implementation

This document describes the validated reference environment used to prove the
FabricTreaty protocol. It does not introduce new doctrine.

## Hardware
- Apple M1 (fanless MacBook Air)
- 8-core SoC (4 Performance, 4 Efficiency)
- 8GB and 16GB RAM configurations tested
- Unified memory architecture (~68 GB/s)

## Operating System
- Fedora Asahi Remix 42 / 43
- Linux kernel 6.19
- systemd-based userspace

## Enforced Policies
The following FabricTreaty policies are enforced via systemd:

- Real-time scheduling (`CPUSchedulingPolicy=rr`)
- High-priority execution (`CPUSchedulingPriority=90`)
- Performance-core pinning (P-cores only)
- Locked working set (`LimitMEMLOCK=16384`)
- Privilege containment (`NoNewPrivileges=true`)
- Masked non-essential background services

These policies are enforced entirely at the OS level using existing primitives.

## Explicit Exclusions
- Apple Neural Engine (ANE) is not used
- No firmware negotiation or coprocessor scheduling
- No background update, telemetry, or discovery daemons

These exclusions are intentional and required for deterministic behavior.

## Observed Effects
On a fanless M1 Air, enforcing FabricTreaty produces:

- Reduced time-to-first-response due to elimination of coprocessor handshakes
- Predictable thermal behavior with longer sustained peak frequency
- Lower scheduler jitter under load
- Increased usable memory headroom on 8GB systems
- Stable execution without swap-induced stalls

## What This Proves
The Apple Silicon M1 environment demonstrates that FabricTreaty:

- Works under asymmetric-core architectures
- Holds under tight thermal and power constraints
- Does not require vendor-specific drivers or firmware access
- Restores deterministic behavior on modern SoCs

Apple hardware is used as a proving ground due to its constraints, not as a target.
