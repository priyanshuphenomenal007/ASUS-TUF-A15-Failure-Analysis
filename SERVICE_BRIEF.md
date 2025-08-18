# Service Review Brief — ASUS TUF A15 (FA506ICB)
**Prepared:** 2025-08-18 | **Owner:** Priyanshu Kumar

## Summary
- Multiple **unclean shutdowns** have been recorded (Event ID **41** / **6008**) under normal use on a freshly installed OS.
- Post-incident, the **dedicated GPU (dGPU) intermittently disappears** from the system (no listing in Device Manager / `Win32_VideoController`).
- The issue persists across various driver versions, ruling out a simple driver bug.
- Vendor diagnostics (MyASUS) repeatedly report “No problem found,” which directly conflicts with the system's own crash logs and device state.

## Key Evidence (publicly available in this repository)
- `baseline/` — System identity (dxdiag, systeminfo), a full driver manifest, and power/battery health reports.
- `evidence/runs/<timestamp>/` — Raw `.evtx` exports and focused CSVs for Kernel-Power crashes (ID 41/6008) and NVIDIA driver errors (`nvlddmkm`).
- `evidence/gpu_watchdog_log.csv` — A time-stamped log file tracking the presence and disappearance of the GPU.
- `reports/` — Reliability Monitor plot providing a clear visual timeline of critical stability events.

## Interpretation
The pattern of unclean shutdowns (Event ID 41), combined with the **temporary disappearance of the dGPU** post-incident, strongly suggests a hardware fault along the GPU/PCIe/motherboard power path. This is not indicative of a software-only issue, especially given that the failures occurred immediately after a clean OS installation by an official technician.

## Objective
The objective of this brief and its associated repository is to serve as a public, evidence-based case study of a recurring hardware fault and subsequent service failures, advocating for greater corporate accountability.
