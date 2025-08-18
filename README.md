# Failure Analysis — ASUS TUF Gaming A15 (FA506ICB)
**Report Date:** [redacted-phone] | **System S/N:** N7NRCX07W******304

> **Scope:** The evidence within this repository documents a pattern of recurring and evolving critical system failures. The data includes raw XML reports from the Windows Reliability Monitor that explicitly log critical failures of both ASUS and NVIDIA software, corroborating video evidence of the dGPU's live degradation from a non-responsive "zombie" state to a complete hardware disconnection.

---

## Evidence Map (Table of Contents)

* **SERVICE_BRIEF.md:** A one-page executive summary of the entire case.
* **/reports/:** Visual summaries and the raw **XML Reliability Reports** providing a definitive, verifiable log of critical failures.
* **/baseline/:** System identity, driver manifests, and power/battery health reports.
* **/evidence/runs/:** Timestamped folders with raw `.evtx` system logs and focused `.csv` reports of crashes.
* **/snippets/:** Detailed XML data for four distinct, critical `Kernel-Power` failures.
* **/Video_Evidence/:** A file with links to all video proof, including the live hardware degradation sequence.
* **/evidence/HWiNFO.CSV**: Detailed, timestamped logs of system thermals.
* **CHECKSUMS_SHA256.csv:** A file containing cryptographic hashes to verify the integrity of all evidence files.

---
## Methodology & Tools Used
Evidence was collected using standard, first-party Microsoft tools (`wevtutil`, `powercfg`, Reliability Monitor) and trusted third-party diagnostic software (HWiNFO) to ensure authenticity and objectivity.

---
## Objective of this Repository
The objective of this public repository is to provide a detailed, verifiable, and evidence-based case study of a recurring hardware fault and the subsequent service failures, intended as a resource for other consumers and to advocate for greater corporate accountability.
