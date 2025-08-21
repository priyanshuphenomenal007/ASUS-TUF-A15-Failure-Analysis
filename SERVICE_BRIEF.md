# Service Review Brief — ASUS TUF A15 (FA506ICB)
**Prepared:** [redacted-phone] | **Owner:** Priyanshu Kumar

## Summary
- **Systemic, Multi-Component Hardware Failure Documented:**
  - The system suffers from a catastrophic failure affecting **both** graphics processors.
  - The dedicated **NVIDIA dGPU** intermittently disconnects, enters a non-responsive "zombie" state, and is the source of `BugcheckCode 159` BSODs.
  - The integrated **AMD iGPU** is now also in a failed state, with Windows unable to load its drivers, logging a definitive **"Code 31"** error.
- This dual-GPU failure is supported by a multi-day history of critical `Kernel-Power` crashes, video evidence of live hardware degradation, and failures of both ASUS's and NVIDIA's own software.
- **HWiNFO logs** confirm all failures occur under normal thermal conditions, ruling out overheating.

## Interpretation
The simultaneous failure of two separate, critical graphics components (NVIDIA and AMD) is irrefutable evidence of a systemic fault with the motherboard. The problem is not isolated to a single chip or driver; it is a core hardware failure.

## Objective
The objective of this brief and its associated repository is to serve as a public, evidence-based case study of a recurring, systemic hardware fault and a subsequent negligent service process.


