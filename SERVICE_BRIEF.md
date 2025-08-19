# Service Review Brief — ASUS TUF A15 (FA506ICB)
**Prepared:** 2025-08-19 | **Owner:** Priyanshu Kumar

## Summary
- **Multiple, Evolving Failure Modes Documented:**
  - The system suffers from recurring **unclean shutdowns** (Event ID **41**), including a confirmed **BSOD (`BugcheckCode 159`)**.
  - Raw XML reports from the Windows Reliability Monitor confirm critical failures of **NVIDIA's `NVDisplay.Container.exe`**.
  - **ASUS's own Armoury Crate software** logs and visually confirms the dedicated GPU (dGPU) is in a non-responsive "zombie" state with **0% utilization**.
  - Video evidence documents the **live degradation of the dGPU** from this "zombie" state to a **complete hardware disconnection** from Device Manager, all without a system reboot.
- **HWiNFO logs** confirm all failures occur under normal thermal conditions, ruling out overheating.

## Interpretation
The pattern of BSODs, hard freezes, the live degradation of the GPU, and critical failures logged by both Windows and ASUS's own software overwhelmingly points to a systemic hardware fault with the motherboard.

## Objective
The objective of this brief and its associated repository is to serve as a public, evidence-based case study of a recurring hardware fault and subsequent service failures.