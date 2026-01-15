# FabricTreaty
FabricTreaty defines a hardware-agnostic protocol for deterministic, sovereign compute. It classifies accelerators by instruction jurisdiction and provides hardened systemd profiles that enforce low-latency, low-jitter execution. Includes a reference implementation for Apple Silicon (M1–M3) on Asahi Linux.


FabricTreaty

FabricTreaty is a hardware-agnostic protocol for deterministic, sovereign compute.
It classifies accelerators by instruction jurisdiction (who owns the control plane),
and provides reference appliance profiles that enforce low-jitter execution through
systemd policy (CPU affinity, RT scheduling, memlock, and service masking).

Core idea:
Only compute whose instruction surface is directly under your kernel’s jurisdiction
can be treated as sovereign. Everything else is negotiated.

Repository layout
- docs/        Doctrine and threat model
- profiles/    systemd targets (opt-in appliance modes)
- services/    hardened service units (fabricd and friends)
- scripts/     one-shot hardening helpers

Status
- Doctrine: general
- Reference implementation: Apple Silicon (M1/M2/M3) on Fedora Asahi Remix (early 2026)

License
Apache-2.0
