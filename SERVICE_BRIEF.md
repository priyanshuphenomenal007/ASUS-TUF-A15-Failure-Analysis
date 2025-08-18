# Service Review Brief — ASUS TUF A15 (FA506ICB)
**Prepared:** [redacted-phone] | **Owner:** Priyanshu Kumar

## Summary
- **Multiple, Evolving Failure Modes Documented:**
  - The system suffers from recurring **unclean shutdowns** (Event ID **41**), including a confirmed **BSOD (`BugcheckCode 159`)**.
  - Video evidence from Aug 18 documents the **live degradation of the dGPU in real-time**: moving from a detected but **unresponsive "zombie" state** (0% utilization) to a **complete hardware disconnection** from Device Manager, all without a system reboot.
- **HWiNFO logs** confirm these failures occur under normal thermal conditions, definitively ruling out overheating.
- Vendor diagnostics repeatedly report “No problem found,” directly contradicting the system's own logs and visually documented failures.

## Key Evidence (publicly available in this repository)
- `baseline/` — System identity, a full driver manifest, and power/battery health reports.
- `evidence/runs/` — Raw `.evtx` logs and focused CSVs of the recurring critical crashes.
- `snippets/` — Detailed XML data for four distinct `Kernel-Power` failures.
- `Video_Evidence/` — Links to video proof of all documented failure modes.
- `evidence/HWiNFO_...CSV` files — Detailed logs of system thermals and voltages.

## Interpretation
The pattern of BSODs (`DRIVER_POWER_STATE_FAILURE`), hard freezes, a physically disappearing GPU, and a non-responsive "zombie" GPU state, all occurring under safe thermal conditions, overwhelmingly points to a systemic hardware fault with the motherboard's power delivery or PCIe path.

## Objective
The objective of this brief and its associated repository is to serve as a public, evidence-based case study of a recurring hardware fault and subsequent service failures, advocating for greater corporate accountability.
