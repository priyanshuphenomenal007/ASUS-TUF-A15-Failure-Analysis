# Failure Analysis — ASUS TUF Gaming A15 (FA506ICB)
**Report Date:** 2025-08-18 | **System S/N:** N7NRCX07W******304

> **Scope:** The evidence contained within this repository demonstrates repeated, critical system failures, including unclean shutdowns and the intermittent disappearance of the dedicated GPU, immediately following a clean OS installation by an official technician. These observations strongly suggest a recurring, systemic hardware fault.

---

## Evidence Map (Table of Contents)

* **SERVICE_BRIEF.md:** A one-page executive summary of the entire case.
* **/baseline/:** System identity, driver manifests, and power/battery health reports taken from a clean state.
* **/evidence/runs/<timestamp>/:** Timestamped folders containing the raw `.evtx` system logs and focused `.csv` reports of critical crashes and hardware errors.
* **/reports/:** Visual summaries, including screenshots from the Windows Reliability Monitor.
* **Email_Screenshots/:** A complete, visual "paper trail" of the service interaction.

---

## Crash Timeline

A detailed, auto-generated timeline of key crash events is available in the latest evidence run folder. This timeline correlates critical `Kernel-Power` events with specific NVIDIA driver (`nvlddmkm`) hardware errors.

---

## Methodology & Tools Used

The evidence in this repository was collected using standard, first-party Microsoft Windows tools to ensure authenticity and objectivity.

1.  **Raw logs** were exported via `wevtutil epl` and filtered into CSVs via `Get-WinEvent`.
2.  **System and driver states** were captured using `systeminfo`, `dxdiag`, and `Get-CimInstance`.
3.  **Power and battery health reports** were generated using `powercfg /energy` and `/batteryreport`.
4.  **File integrity** can be verified using the `CHECKSUMS_SHA256.csv` file in the root directory.

---

## Objective of this Repository

The objective of this public repository is to provide a detailed, verifiable, and evidence-based case study of a recurring hardware fault and the subsequent service failures. It is intended to serve as a resource for other consumers and to advocate for greater corporate accountability and more thorough diagnostic procedures in the consumer electronics industry.
