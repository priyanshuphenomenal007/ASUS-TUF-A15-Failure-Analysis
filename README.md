# Failure Analysis — ASUS TUF Gaming A15 (FA506ICB)
**Report Date:** 2025-08-22  | **System S/N:** N7NRCX07W******304

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

## Acknowledgments

The author would like to acknowledge the use of Google's Gemini large language model in the preparation of this report. The AI served several roles in this project:

* **As a Strategic Sounding Board:** It was used to analyze the strategic and psychological implications of various actions and to role-play the likely reactions of the corporate entities involved.
* **As a Writing and Organizational Assistant:** It assisted in drafting and refining the professional language for the public-facing documents (`README.md`, `SERVICE_BRIEF.md`), social media posts, and other communications.
* **As a Technical Assistant:** It provided the initial code for the PowerShell scripts used for evidence collection and the Git commands for repository management.

It is also critical to note that the AI's repeated and significant analytical blunders—including misinterpreting visual evidence and failing to adhere to basic constraints—served as an **unintentional but rigorous quality control mechanism.** This forced the author to independently and meticulously verify every single piece of evidence and strategic decision, which ultimately strengthened the final report's integrity and accuracy.

Other AI models were used for general-purpose tasks such as text summarization and brainstorming during the initial research phase.

The final analysis, all strategic decisions, and the complete, verified body of evidence are the sole work of the author.



