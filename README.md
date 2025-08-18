# Failure Analysis — ASUS TUF Gaming A15 (FA506ICB)
**Report Date:** [redacted-phone] | **System S/N:** N7NRCX07W******304

> **Scope:** The evidence within this repository documents a pattern of recurring, critical system failures on a freshly installed OS. The data correlates these crashes (`Kernel-Power Event ID 41`) with the intermittent disappearance of the dedicated GPU and a specific `BugcheckCode 159 (DRIVER_POWER_STATE_FAILURE)`. HWiNFO logs confirm these failures are not caused by overheating, strongly suggesting a systemic hardware fault.

---

## Evidence Map (Table of Contents)

* **SERVICE_BRIEF.md:** A one-page executive summary of the entire case.
* **/baseline/:** System identity, driver manifests, and power/battery health reports.
* **/evidence/runs/:** Timestamped folders with raw `.evtx` system logs and focused `.csv` reports of crashes.
* **/snippets/:** Detailed XML data for four distinct, critical `Kernel-Power` failures.
* **/Video_Evidence/:** A file with links to video proof of the dGPU disappearing, a BSOD, and other system instabilities.
* **/reports/:** Visual summaries from the Windows Reliability Monitor and Event Viewer.
* **/evidence/HWiNFO.CSV**: A detailed, timestamped log of system thermals and voltages.

---

## Methodology & Tools Used
Evidence was collected using standard, first-party Microsoft tools (`wevtutil`, `powercfg`) and trusted third-party diagnostic software (HWiNFO) to ensure authenticity and objectivity. File integrity is verifiable via the `CHECKSUMS_SHA256.csv` file.

---

## Objective of this Repository
The objective of this public repository is to provide a detailed, verifiable, and evidence-based case study of a recurring hardware fault and the subsequent service failures. It is intended as a resource for other consumers and to advocate for greater corporate accountability.
