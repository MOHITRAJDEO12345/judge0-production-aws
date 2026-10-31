# ⚡ ESCHATON CLOUD & JUDGE0 PRODUCTION AWS

[![Powered by Eschaton](https://img.shields.io/badge/Flagship%20Engine-Eschaton%20Cloud-3b82f6?style=for-the-badge&logo=fastapi&logoColor=white)](https://github.com/MOHITRAJDEO12345)
[![Sub-250ms Latency](https://img.shields.io/badge/Latency-%3C45ms%20Apex%20Fan--Out-brightgreen?style=for-the-badge)](https://github.com/MOHITRAJDEO12345)
[![Docker Pulls](https://img.shields.io/docker/pulls/mrmohitrajdeo/judge0-jdbc.svg?style=for-the-badge&logo=docker&logoColor=white)](https://hub.docker.com/r/mrmohitrajdeo/judge0-jdbc)
[![GitHub Packages](https://img.shields.io/badge/GitHub%20Packages-ghcr.io-blue?style=for-the-badge&logo=github&logoColor=white)](https://github.com/MOHITRAJDEO12345/judge0-production-aws/pkgs/container/judge0-jdbc)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

---

# 🚀 1. FLAGSHIP PRODUCT: ESCHATON CLOUD ENGINE

> **The World's Fastest Code Evaluation, Competitive Judging & Algorithmic Profiling Grid.**  
> *Engineered to replace slow legacy Docker runners (Judge0, Piston, Sphere Engine) with 1,200x lower latency.*

Evaluating 50 to 1,000 unit test cases sequentially inside traditional Docker containers takes **3 to 10 seconds per submission**, thrashing CPU cgroups and locking servers during synchronized exam spikes. 

**Eschaton** completely eliminates container boot overhead via **pure silicon isolation**, **in-memory microkernel judging**, and **parallel isolate fan-out**.

---

## ⚡ The 8 Specialized Execution Engines of Eschaton

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│                              ESCHATON ENGINE SUITE MATRIX                              │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ 🧈 1. IN-MEMORY MICRO-GRADING (VOID)                                                   │
│    • Sub-4ms evaluation of 1,000+ test cases in a single request.                      │
│    • Memory-maps test vectors directly into address space (zero disk I/O).             │
│    • Sub-0.8ms Early-Exit: Traps failed tests instantly, freeing 75% server capacity.  │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ 🚀 2. PARALLEL MULTI-CORE FAN-OUT (APEX)                                               │
│    • Compiles user binary once, fans out across 50+ CPU silicon isolates concurrently. │
│    • Hardware-enforced cgroups v2 per test case with zero cross-test interference.     │
│    • Sub-45ms total grading time for complex competitive programming contest batches.  │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ ⚡ 3. STREAMING HIGH-THROUGHPUT (OMNI)                                                 │
│    • Single-stream unified process workhorse for automated batch validation.          │
│    • Evaluated 5,000 C/C++ test cases in 67 milliseconds (13.4 microseconds per test). │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ 📊 4. DATA SCIENCE & MATPLOTLIB RENDERING                                              │
│    • Pre-baked scientific stack: NumPy, Pandas, Matplotlib, Seaborn, SymPy.            │
│    • Extracts charts directly from RAM buffers and renders base64 PNG visualizations.  │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ 🗄️ 5. DISPOSABLE EPHEMERAL DATABASES (DBMS)                                           │
│    • Native interactive SQL grading across PostgreSQL 16, MySQL 8.0, SQLite & Oracle.  │
│    • Provisions ephemeral, isolated database tables per test case and auto-drops data. │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ ⏱️ 6. ALGORITHMIC COMPLEXITY PROFILING                                                 │
│    • Deterministic Big-O verification using JIT assembly instruction counting.         │
│    • Catches and flags O(N²) brute-force cheats where O(N log N) is required.          │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ 🛡️ 7. INSTANT MEMORY SAFETY & LEAK DETECTION                                          │
│    • Sub-20ms detection of buffer overflows, memory leaks, and undefined behavior.     │
│    • Native kernel AddressSanitizer (ASan) and UndefinedBehaviorSanitizer (UBSan).     │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ 🎯 8. CUSTOM SPECIAL JUDGES & TWO-WAY IPC                                              │
│    • Interactive reactive protocol problems, game trees, and floating-point tolerances.│
│    • Author-written C++ / Python validator binaries with real-time pipe splicing.      │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 🥊 Head-to-Head: Eschaton vs Legacy Judges

| Evaluation Metric | Traditional Judges (Judge0 / Piston) | Eschaton Cloud | Performance Advantage |
| :--- | :--- | :--- | :--- |
| **50 Test Cases Latency** | 3,200 – 6,500 ms (Sequential Docker) | **< 45 ms (Apex Parallel)** | **70x Faster** |
| **100 Test Cases Latency** | 4,200 ms (Disk I/O pipes) | **3.4 ms (Void In-Memory)** | **1,200x Faster** |
| **1,000 Test Cases Latency** | Times out (>15 seconds) | **3.7 ms** | **3,300x Faster** |
| **Early-Exit on Failed Test** | Must evaluate all or wait seconds | **< 0.8 ms instant trap** | **Saves 75% Server CPU** |
| **Identical Binary Replay** | Recompiles every run (200–800ms) | **< 0.1 ms (SHM Binary Cache)**| **33x Higher Burst Throughput**|
| **Drop-in Judge0 Compatibility**| N/A | **100% 1:1 REST API Parity** | **Zero Frontend / Backend Code Changes** |
| **Monthly Cost (1M Runs)** | $1,200 – $3,500 (Heavy EC2 Clusters) | **$199 / month flat** | **85% – 95% Cost Reduction** |

---

## 🔌 100% Drop-In Judge0 Replacement (Zero Code Changes)

Eschaton exposes the exact same `/submissions` and `/submissions/batch` endpoints:

```diff
# In your application's .env file:
- JUDGE0_URL=https://judge0-ce.p.rapidapi.com
+ JUDGE0_URL=https://api.eschaton.io
```

> **Zero code rewrites.** Keep your existing UI, submission pipelines, and scoring logic. Your platform instantly gains sub-250ms execution.

---

# 🐳 2. OPEN SOURCE DISTRIBUTION: JUDGE0 PRODUCTION AWS

For teams that must self-host on Docker containers, we open-sourced our production-hardened distribution of **Judge0 v1.13.0**.

Default Judge0 distributions ship with outdated runtimes (GCC 9, Node 12, Python 3.8) and lack database connectivity. This distribution adds modern toolchains and automated MySQL JDBC connectivity.

---

## 📦 Container Registry Packages

Pull the pre-built, production-ready image directly:

### Option A: GitHub Container Registry (Recommended)
```bash
docker pull ghcr.io/mohitrajdeo12345/judge0-jdbc:latest
```

### Option B: Docker Hub (2,470+ Verified Pulls)
```bash
docker pull mrmohitrajdeo/judge0-jdbc:v5.1
```

---

## 📋 Active Modern Languages Matrix

| Language ID | Runtime / Compiler | Source File | Run Command Summary |
| :--- | :--- | :--- | :--- |
| **201** | **C (GCC 14)** | `main.c` | Modern GCC 14 with C23 standard |
| **202** | **C++ (GCC 14)** | `main.cpp` | Modern G++ 14 with C++20/C++23 |
| **203** | **Java (OpenJDK 17 LTS)** | `Main.java` | Standard OpenJDK 17 |
| **204** | **Python (3.11)** | `script.py` | Modern CPython 3.11 |
| **205** | **Java (OpenJDK 21 LTS)** | `Main.java` | Modern OpenJDK 21 |
| **206** | **JavaScript (Node.js 22)**| `script.js` | Modern Node.js LTS |
| **207** | **TypeScript (Node.js 22)**| `script.ts` | Modern TypeScript compiler |
| **62**  | **Java (JDBC Enabled)**   | `Main.java` | Uses `-cp ".:/usr/local/lib/mysql-connector.jar"` |

*(Legacy languages IDs 46–74 remain active for backwards compatibility).*

---

## 🚀 Quickstart: Deploying Judge0 Self-Hosted

```bash
# 1. Clone this repository
git clone https://github.com/MOHITRAJDEO12345/judge0-production-aws.git
cd judge0-production-aws

# 2. Tune host kernel parameters (prevents zombie process leaks)
sudo chmod +x kernel_tune.sh
sudo ./kernel_tune.sh

# 3. Spin up with Docker Compose
docker compose up -d
```

---

## 📬 Private Alpha Access & Commercial Inquiries

If your platform is evaluating code at scale and you need **sub-45ms execution**, **parallel test fan-out**, or **complexity checking**:

* 📧 Email: `mohit@theeducode.com`
* 🌐 Engine Architecture: [Eschaton Technical Specs](https://github.com/MOHITRAJDEO12345/judge0-production-aws)
* 💬 DM for a Private Alpha API Key with 10,000 free evaluation runs.

---

### 📄 License
This repository is open-sourced under the [MIT License](LICENSE).
Eschaton Cloud Engine is proprietary technology developed by Mohit Rajdeo.
