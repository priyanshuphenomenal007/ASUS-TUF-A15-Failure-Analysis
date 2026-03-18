# Hardware Failure Analysis — ASUS TUF Gaming A15 (FA506ICB)

A structured diagnostic investigation into concurrent GPU failures
on a consumer laptop, using kernel event logs, thermal telemetry,
and driver state analysis to isolate probable root cause.

---

## Failure Summary

Both the dedicated NVIDIA dGPU and integrated AMD iGPU exhibited
failure states on the same system.

The central diagnostic question:

* Shared root cause (e.g., motherboard / power delivery)
* Independent component failures

**Conclusion (evidence-based):**
Observed behavior strongly indicates a systemic hardware fault
at the motherboard or power delivery layer.
Thermal causes are eliminated by recorded telemetry.

---

## Diagnostic Methodology

### Step 1 — Thermal Elimination

HWiNFO64 logs collected across multiple failure events.

* GPU temperatures remained within 60–75°C
* No thermal throttling or spike preceding failure events

This eliminates heat-induced instability as a primary cause.

---

### Step 2 — Kernel Event Analysis

Windows Reliability Monitor and Event Viewer logs extracted.

* 4× critical Kernel-Power events (Event ID 41)
* No preceding error or graceful shutdown sequence

Raw XML files available in `/snippets/`.

---

### Step 3 — Driver State Analysis

* **AMD iGPU:** Persistent Code 31
  ("device not working properly") across reinstalls

* **NVIDIA dGPU:**
  Progressive instability under standard workload
  (artifacting, device disappearance)

Failures occurring under normal thermal conditions
reduce likelihood of driver-only root cause.

---

### Step 4 — Cross-Component Correlation

Observed:

* Failure of both iGPU and dGPU
* Independent driver stacks
* Shared dependency: motherboard power delivery and PCIe fabric

This convergence strongly indicates a shared hardware-level fault.

---

## Evidence Structure

```text
/baseline/         — System specifications, driver manifests  
/evidence/         — HWiNFO logs, crash event CSVs  
/reports/          — Reliability Monitor exports, event logs  
/scripts/          — PowerShell checksum generation utility  
/snippets/         — Raw XML (Kernel-Power Event ID 41)  
CHECKSUMS_SHA256   — Integrity verification for all files
```

---

## Evidence Correlation

| Event Type           | Source File Location | Description                           |
| -------------------- | -------------------- | ------------------------------------- |
| Thermal telemetry    | `/evidence/`         | HWiNFO logs during failure windows    |
| Kernel critical logs | `/snippets/`         | Event ID 41 XML (unexpected shutdown) |
| Reliability reports  | `/reports/`          | System-level failure timeline         |
| Driver state         | `/baseline/` + logs  | Device Manager + driver manifests     |

All evidence artifacts are checksummed.

---

## Integrity Verification

Each file in this repository is hashed using SHA-256.

To verify:

```powershell
Get-FileHash <file> -Algorithm SHA256
```

Compare output with entries in:

```
CHECKSUMS_SHA256.csv
```

This ensures:

* No post-capture modification
* Reproducible validation of all artifacts

---

## Key Technical Findings

* GPU temperatures: 60–75°C at failure
* 4× Kernel-Power Event ID 41 (no preceding errors)
* AMD iGPU Code 31 persists across driver reinstalls
* NVIDIA dGPU instability under normal load
* Cross-GPU failure eliminates isolated component fault hypothesis

---

## Limitations

* No direct motherboard-level electrical diagnostics
* No oscilloscope / VRM telemetry data
* Conclusion based on system-level observables

---

## Scope

This repository contains only technical diagnostic artifacts.

Excluded:

* Service interaction records
* Consumer complaint documentation
* Narrative or legal framing

---

## Metadata

* **Author:** Priyanshu Kumar
* **System:** ASUS TUF Gaming A15 FA506ICB
* **Serial:** [REDACTED]
* **Date:** August 2025
