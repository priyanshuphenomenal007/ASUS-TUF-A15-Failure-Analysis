# Service Review Brief — ASUS TUF A15 (FA506ICB)
**Prepared:** [redacted-phone] | **Owner:** Priyanshu Kumar

## Summary
- **Multiple Failure Modes Documented:**
  - Repeated **unclean shutdowns** recorded (Event ID **41**), including a confirmed **BSOD (`BugcheckCode 159`)** and several hard freezes (`BugcheckCode 0`).
  - The **dedicated GPU (dGPU) intermittently disappears** from the system entirely, as documented in video evidence.
  - The dGPU has also been proven to enter a **"zombie" state**: detected by Device Manager but showing **0% utilization** in Task Manager and failing to activate in Armoury Crate.
- **HWiNFO logs** confirm these failures occur under normal thermal conditions, ruling out overheating.
- Vendor diagnostics repeatedly report “No problem found,” which directly conflicts with the system's own logs and visually documented failures.

## Key Evidence (publicly available in this repository)
- `baseline/` — System identity, a full driver manifest, and power/battery health reports.
- `evidence/runs/` — Raw `.evtx` logs and focused CSVs of the recurring critical crashes.
- `snippets/` — Detailed XML data for four distinct `Kernel-Power` failures.
- `Video_Evidence/` — Links to video proof of all documented failure modes.
- `evidence/HWiNFO.CSV` — A detailed log of system thermals and voltages.

## Interpretation
The pattern of BSODs (`DRIVER_POWER_STATE_FAILURE`), hard freezes, a physically disappearing GPU, and a non-responsive "zombie" GPU state, all occurring under safe thermal conditions, overwhelmingly points to a systemic hardware fault with the motherboard's power delivery or PCIe path.

## Objective
The objective of this brief and its associated repository is to serve as a public, evidence-based case study of a recurring hardware fault and subsequent service failures, advocating for greater corporate accountability.
