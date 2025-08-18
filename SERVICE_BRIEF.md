# Service Review Brief — ASUS TUF A15 (FA506ICB)
**Prepared:** [redacted-phone] | **Owner:** Priyanshu Kumar

## Summary
- Multiple **unclean shutdowns** recorded (Event ID **41**), including a confirmed **BSOD (`BugcheckCode 159`)** and several hard freezes (`BugcheckCode 0`), on a freshly installed OS.
- Post-incident, the **dedicated GPU (dGPU) intermittently disappears** from the system, as documented in video evidence.
- **HWiNFO logs** show that these failures occur under normal thermal conditions, ruling out overheating.
- Vendor diagnostics repeatedly report “No problem found,” which directly conflicts with the system's own crash logs.

## Key Evidence (publicly available in this repository)
- `baseline/` — System identity, a full driver manifest, and power/battery health reports.
- `evidence/runs/` — Raw `.evtx` logs and focused CSVs of the recurring critical crashes.
- `snippets/` — Detailed XML data for four distinct `Kernel-Power` failures.
- `Video_Evidence/` — Links to video proof of the dGPU disappearing, a BSOD, and pre-service instability.
- `evidence/HWiNFO.CSV` — A detailed log of system thermals and voltages.

## Interpretation
The pattern of both BSODs (`DRIVER_POWER_STATE_FAILURE`) and hard freezes, combined with the visual proof of the dGPU intermittently disappearing under safe thermal conditions, strongly suggests a systemic hardware fault with the motherboard's power delivery or PCIe path.

## Objective
The objective of this brief and its associated repository is to serve as a public, evidence-based case study of a recurring hardware fault and subsequent service failures, advocating for greater corporate accountability.
