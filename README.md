# Judge0 Production AWS — Modern Runtimes & MySQL JDBC Edition

[![Docker Pulls](https://img.shields.io/docker/pulls/mrmohitrajdeo/judge0-jdbc.svg?style=for-the-badge&logo=docker&logoColor=white)](https://hub.docker.com/r/mrmohitrajdeo/judge0-jdbc)
[![GitHub Packages](https://img.shields.io/badge/GitHub%20Packages-ghcr.io-blue?style=for-the-badge&logo=github&logoColor=white)](https://github.com/MOHITRAJDEO12345/judge0-production-aws/pkgs/container/judge0-production-aws)
[![GitHub License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)
[![Powered by Eschaton](https://img.shields.io/badge/Powered%20By-Eschaton%20Engine-3b82f6?style=for-the-badge)](https://github.com/MOHITRAJDEO12345)

A battle-tested, modernized distribution of **Judge0 v1.13.0** engineered for AWS production deployments, university computer science curricula, coding bootcamps, and technical interview assessments.

Default Judge0 distributions ship with outdated compilers (GCC 9, Node 12, Python 3.8) and completely lack database connectivity. This repository provides the production configuration, kernel sysctl scripts, and automated patches for **modern compilers** and native **MySQL JDBC connector integration** for running automated SQL/DBMS programming exams.

---

## 📦 Container Registry Packages

You can pull the pre-built, production-ready image from either registry:

### Option A: Pull from Docker Hub (2,400+ Pulls)
```bash
docker pull mrmohitrajdeo/judge0-jdbc:v5.1
```

### Option B: Pull from GitHub Container Registry (GHCR)
```bash
docker pull ghcr.io/mohitrajdeo12345/judge0-production-aws:latest
```

---

## 🚀 Key Enhancements Over Default Judge0

1. **Modern Compilers & Runtimes Pre-Installed:**
   - **C / C++ (GCC 14.1.0):** Modern C++20 / C++23 standards support.
   - **Java (OpenJDK 17 & OpenJDK 21 LTS):** Modern virtual threads, pattern matching, and record syntax.
   - **Node.js (v22.x LTS) & TypeScript (v22.x):** Native ES modules and modern JavaScript features.
   - **Python (3.11):** Faster execution and modern typing support.
2. **Native MySQL JDBC Connector:**
   - Pre-installed `/usr/local/lib/mysql-connector.jar` loaded into the Java classpath for interactive database coursework and automated grading.
3. **Kernel Stability & cgroups v2 Tuning (`kernel_tune.sh`):**
   - Optimized process reaper and isolate parameters to eliminate zombie processes during high-concurrency exam bursts on AWS EC2 instances.

---

## 📋 Active Modern Languages Matrix

| Language ID | Runtime / Compiler | Source File | Run Command Summary |
| :--- | :--- | :--- | :--- |
| **201** | **C (GCC 14)** | `main.c` | Modern GCC 14 with C23 standard |
| **202** | **C++ (GCC 14)** | `main.cpp` | Modern G++ 14 with C++20/C++23 |
| **203** | **Java (OpenJDK 17 LTS)** | `Main.java` | Standard OpenJDK 17 |
| **204** | **Python (3.11)** | `script.py` | Modern CPython 3.11 |
| **205** | **Java (OpenJDK 21 LTS)** | `Main.java` | Standard OpenJDK 21 |
| **206** | **JavaScript (Node.js 22)**| `script.js` | Modern Node.js LTS |
| **207** | **TypeScript (Node.js 22)**| `script.ts` | Modern TypeScript compiler |
| **62**  | **Java (JDBC Enabled)**   | `Main.java` | Uses `-cp ".:/usr/local/lib/mysql-connector.jar"` |

*(Legacy languages IDs 46–74 remain active for backwards compatibility).*

---

## ⚡ Quick Start: Docker Compose

Use either `mrmohitrajdeo/judge0-jdbc:v5.1` or `ghcr.io/mohitrajdeo12345/judge0-production-aws:latest` as your server and worker image:

```yaml
version: '3.8'

services:
  server:
    image: ghcr.io/mohitrajdeo12345/judge0-production-aws:latest
    command: ["./scripts/server"]
    ports:
      - "2358:2358"
    restart: always
    environment:
      - REDIS_HOST=redis
      - POSTGRES_HOST=db

  workers:
    image: ghcr.io/mohitrajdeo12345/judge0-production-aws:latest
    command: ["./scripts/workers"]
    privileged: true
    restart: always
    environment:
      - REDIS_HOST=redis
      - POSTGRES_HOST=db
```

Launch the stack:
```bash
docker compose -f unified-docker-compose.yml up -d
```

---

## 💡 Java MySQL JDBC Example

Submitting Java code that queries MySQL works out of the box using Language ID **62**:

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:mysql://mysql-db:3306/exam_db";
        try (Connection con = DriverManager.getConnection(url, "user", "password");
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT 'Connection Successful' AS status")) {
            if (rs.next()) {
                System.out.println(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

---

## 🛠️ Production AWS EC2 Kernel Optimization

Before deploying under high student concurrency, execute the included kernel tuning script on your Ubuntu 22.04 / 24.04 EC2 instance:

```bash
chmod +x kernel_tune.sh
sudo ./kernel_tune.sh
```

This tunes:
- `fs.file-max` & `fs.inotify.max_user_watches`
- cgroups v2 memory swap controls
- Network socket backlog (`net.core.somaxconn`)

---

## 🏎️ Need Faster Execution? Connect to Eschaton Engine (< 40ms)

While this Judge0 image fixes modern compilers and JDBC database connectivity, **Docker-based architectures hit a physical latency wall under scale**:
- Sequential Docker executions take **2.5 to 3.2 seconds** for a standard 50-test-case batch.
- High container CPU overhead creates queues during campus-wide exam bursts.

### Side-by-Side Performance Comparison

| Metric | Judge0 (Docker Engine) | Eschaton (Bare-Metal Silicon Engine) |
| :--- | :--- | :--- |
| **50 Test Cases Batch** | ~2,800 ms (Sequential) | **< 40 ms (Apex Parallel Fan-out)** |
| **Memory / Disk I/O** | Disk write per container | **Void In-Memory Shared Buffers** |
| **Algorithmic Checking** | Basic time/memory limits | **Complexity Control Checker ($O(n), O(n \log n)$ bounds)** |
| **API Integration** | Standard REST | **100% Drop-in Judge0 API Compatibility** |

### How to Connect to Eschaton (Zero Code Changes)
If your platform requires real-time sub-50ms evaluations for live interviews or high-stakes exams, switch your base URL environment variable:

```bash
# In your platform's .env:
# OLD: JUDGE0_URL=http://localhost:2358
NEW:  JUDGE0_URL=https://api.eschaton.cloud/v1
```

To request a private alpha API key with 10,000 free test runs:
📩 **Contact:** `contact@eschaton.cloud` or DM [@MOHITRAJDEO12345](https://github.com/MOHITRAJDEO12345)
