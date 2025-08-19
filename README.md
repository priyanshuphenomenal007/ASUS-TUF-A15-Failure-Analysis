# Failure Analysis — ASUS TUF Gaming A15 (FA506ICB)
**Report Date:** 2025-08-19 | **System S/N:** N7NRCX07W******304

> **Scope:** The evidence within this repository documents a pattern of recurring and evolving critical system failures. The data includes raw XML and `.rml` logs from both Windows and ASUS's own Armoury Crate software, which explicitly log critical failures of NVIDIA services and a non-responsive "zombie" state for the dedicated GPU. This is corroborated by video evidence of the dGPU's live degradation and HWiNFO logs that rule out overheating as a cause.

---

## Evidence Map (Table of Contents)

* **SERVICE_BRIEF.md:** A one-page executive summary of the entire case.
* **/reports/:** Visual summaries and the raw **XML Reliability Reports** providing a verifiable log of critical failures.
* **/evidence/runs/:** Timestamped folders with raw `.evtx` system logs and **Armoury Crate `.rml` logs**.
* **/baseline/:** System identity, driver manifests, and power/battery health reports.
* **/snippets/:** Detailed XML data for four distinct, critical `Kernel-Power` failures.
* **/Video_Evidence/:** A file with links to all video proof, including the live hardware degradation sequence.
* **/evidence/HWiNFO.CSV**: Detailed, timestamped logs of system thermals.
* **/Email_Screenshots/:** A complete, visual "paper trail" proving a contradictory and non-transparent service interaction.
* **CHECKSUMS_SHA256.csv:** A file containing cryptographic hashes to verify the integrity of all evidence files.

---

## Methodology & Tools Used
Evidence was collected using standard, first-party Microsoft tools (`wevtutil`, `powercfg`) and trusted third-party diagnostic software (HWiNFO) to ensure authenticity and objectivity. File integrity is verifiable via the `CHECKSUMS_SHA256.csv` file.

---

## Objective of this Repository
The objective of this public repository is to provide a detailed, verifiable, and evidence-based case study of a recurring hardware fault and the subsequent service failures, intended as a resource for other consumers and to advocate for greater corporate accountability and more thorough diagnostic procedures in the consumer electronics industry.