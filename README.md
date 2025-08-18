# Failure Analysis — ASUS TUF Gaming A15 (FA506ICB)
**Report Date:** [redacted-phone] | **System S/N:** N7NRCX07W******304

> **Scope:** The evidence within this repository documents a pattern of recurring and evolving critical system failures on a freshly installed OS. The data includes logs of multiple critical crashes (`BugcheckCode 159`), video proof of the dGPU disappearing, and most critically, video documentation of the **live degradation of the dGPU from a non-responsive "zombie" state to a complete hardware disconnection without a system reboot.** HWiNFO logs confirm all failures occur under normal thermal conditions, strongly suggesting a systemic hardware fault.

---

## Evidence Map (Table of Contents)

* **SERVICE_BRIEF.md:** A one-page executive summary of the entire case.
* **/baseline/:** System identity, driver manifests, and power/battery health reports.
* **/evidence/runs/:** Timestamped folders with raw `.evtx` system logs and focused `.csv` reports of crashes.
* **/snippets/:** Detailed XML data for four distinct, critical `Kernel-Power` failures.
* **/Video_Evidence/:** A file with links to all video proof, including the live hardware degradation sequence.
* **/reports/:** Visual summaries from the Windows Reliability Monitor and Event Viewer.
* **/evidence/HWiNFO_Thermal_Baseline_Pre-Crashes.CSV**: A detailed thermal log establishing a safe operating baseline and ruling out general overheating as a cause.
* **/evidence/HWiNFO_Live_Monitoring_Log_YYYY-MM-DD.CSV**: A continuous log of system thermals and voltages during the period of escalating failures, including during the on-site technician's visit.
* **/Email_Screenshots/:** A complete, visual "paper trail" of the service interaction.
* **CHECKSUMS_SHA256.csv:** A file containing cryptographic hashes to verify the integrity and authenticity of all evidence files.

---

## Methodology & Tools Used
Evidence was collected using standard, first-party Microsoft tools (`wevtutil`, `powercfg`) and trusted third-party diagnostic software (HWiNFO) to ensure authenticity and objectivity. File integrity is verifiable via the `CHECKSUMS_SHA256.csv` file.

---

## Objective of this Repository
The objective of this public repository is to provide a detailed, verifiable, and evidence-based case study of a recurring hardware fault and the subsequent service failures. It is intended as a resource for other consumers and to advocate for greater corporate accountability and more thorough diagnostic procedures in the consumer electronics industry.
