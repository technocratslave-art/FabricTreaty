Instruction Jurisdiction Doctrine

This doctrine classifies compute by control-plane authority, not FLOPS.

Level 1: Sovereign Compute (Public Square)
- Instruction surface is directly addressable by the local kernel MMU.
- The kernel can stop execution immediately, audit resources, and enforce memory policy.
- Examples: CPU ISA extensions (AMX/AVX/SVE), in-core accelerators.

Level 2: Negotiated Compute (Province)
- Brokered by a coprocessor / firmware OS via a mailbox or queue protocol.
- High throughput and standards compliance are possible.
- Sovereignty is conditional: the broker remains opaque and can change terms.
- Rule: treat as detachable throughput; require a Level-1 fallback.

Level 3: Opaque Compute (Vault)
- Locked behind signatures with no public instruction surface.
- No kernel-owned preemption, audit, or kill semantics.
- Rule: do not depend on it in a sovereign stack.

Selection axioms
- Instruction Jurisdiction > FLOPS
- No-Blob Anchor: the root inference path must be buildable from source and target Level 1
- Negotiated resources must be severable without loss of system state
