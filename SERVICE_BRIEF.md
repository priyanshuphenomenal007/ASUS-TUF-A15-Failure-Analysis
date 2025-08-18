# Service Review Brief — ASUS TUF A15 (FA506ICB)
**Prepared:** [redacted-phone] | **Owner:** Priyanshu Kumar

## Summary
- **Multiple, Evolving Failure Modes Documented:**
  - The system suffers from recurring **unclean shutdowns** (Event ID **41**), including a confirmed **BSOD (`BugcheckCode 159`)**.
  - Raw XML reports from the Windows Reliability Monitor confirm critical failures of **ASUS's Armoury Crate Service** and **NVIDIA's `NVDisplay.Container.exe`**.
  - Video evidence documents the **live degradation of the dGPU in real-time**: moving from a detected but **unresponsive "zombie" state** (0% utilization) to a **complete hardware disconnection** from Device Manager, all without a system reboot.
- **HWiNFO logs** confirm these failures occur under normal thermal conditions, ruling out overheating.

## Key Evidence (publicly available in this repository)
- `reports/` — Contains the raw **XML Reliability Reports** for Aug 16, 17, and 18, providing a definitive log of critical failures.
- `baseline/` — System identity, a full driver manifest, and power/battery health reports.
- `evidence/runs/` — Raw `.evtx` logs and focused CSVs of the recurring critical crashes.
- `Video_Evidence/` — Links to video proof of all documented failure modes.

## Interpretation
The combination of BSODs, hard freezes, the live degradation of the GPU, and critical failures of both ASUS and NVIDIA software—all occurring under safe thermal conditions—overwhelmingly points to a systemic hardware fault with the motherboard.

## Objective
The objective of this brief and its associated repository is to serve as a public, evidence-based case study of a recurring hardware fault and subsequent service failures.
