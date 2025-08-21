# Failure Analysis — ASUS TUF Gaming A15 (FA506ICB)
**Report Date:** 2025-08-21 | **System S/N:** N7NRCX07W******304

> **Scope:** This repository documents a catastrophic and systemic hardware failure affecting **both the dedicated NVIDIA dGPU and the integrated AMD iGPU**. The evidence includes raw XML reports, video of a degrading dGPU, and a definitive "Code 31" driver failure for the iGPU. HWiNFO logs confirm all failures occur under normal thermal conditions, irrefutably proving a systemic motherboard fault.

---

## Evidence Map (Table of Contents)

* **SERVICE_BRIEF.md:** A one-page executive summary of the entire case.
* **/reports/:** Visual summaries, raw XML Reliability Reports, and screenshots of critical device errors, including the **AMD iGPU "Code 31" failure**.
* **/baseline/:** System identity, driver manifests, and power/battery health reports.
* **/evidence/runs/:** Timestamped folders with raw `.evtx` system logs and focused `.csv` reports of crashes.
* **/snippets/:** Detailed XML data for four distinct, critical `Kernel-Power` failures.
* **/Video_Evidence/:** Links to all video proof, including the live hardware degradation and the **AMD iGPU failure**.
* **/evidence/**: Contains detailed HWiNFO thermal logs and Armoury Crate diagnostic files.
* **/Email_Screenshots/:** A complete, visual "paper trail" proving a contradictory and non-transparent service interaction.
* **CHECKSUMS_SHA256.csv:** A file containing cryptographic hashes to verify the integrity of all evidence files.

---

## Objective of this Repository
The objective of this public repository is to provide a detailed, verifiable, and evidence-based case study of a recurring hardware fault and the subsequent service failures, intended as a resource for other consumers and to advocate for greater corporate accountability.

## Attribution
All analysis, logs, and video recordings in this repository were independently documented by **Priyanshu Kumar**.  
Redistribution requires attribution under the MIT License.

