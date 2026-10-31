# Supported Languages Reference

This document lists the 16 active languages supported by this custom Judge0 deployment (`mrmohitrajdeo/judge0-jdbc:v5.1` / `latest`). Unnecessary or outdated default languages have been excluded from this list.

---

## 1. Modern Academic Layer (IDs 201–207)

These compilers and runtimes are added/configured to support modern coursework requirements.

| ID | Language | Source File | Compiler Command (`compile_cmd`) | Execution Command (`run_cmd`) |
| :--- | :--- | :--- | :--- | :--- |
| **201** | C (GCC 14) | `main.c` | `/usr/local/gcc14/bin/gcc %s main.c` | `LD_LIBRARY_PATH=/usr/local/gcc14/lib64 ./a.out` |
| **202** | C++ (GCC 14) | `main.cpp` | `/usr/local/gcc14/bin/g++ %s main.cpp` | `LD_LIBRARY_PATH=/usr/local/gcc14/lib64 ./a.out` |
| **203** | Java (OpenJDK 17) | `Main.java` | `/usr/local/openjdk17/bin/javac %s Main.java` | `/usr/local/openjdk17/bin/java Main` |
| **204** | Python (3.11) | `script.py` | *None (interpreted)* | `/usr/local/python-3.11/bin/python3 script.py` |
| **205** | Java (OpenJDK 21) | `Main.java` | `/usr/local/openjdk21/bin/javac %s Main.java` | `/usr/local/openjdk21/bin/java Main` |
| **206** | JavaScript (Node.js 22) | `script.js` | *None (interpreted)* | `/usr/local/node-v22/bin/node script.js` |
| **207** | TypeScript (Node.js 22) | `script.ts` | `/usr/local/node-v22/bin/node /usr/local/node-v22/lib/node_modules/typescript/lib/tsc.js %s script.ts` | `/usr/local/node-v22/bin/node script.js` |

---

## 2. Legacy / Compatibility Layer (IDs 46–74)

These standard languages are pre-installed in the base Judge0 image and are active to support existing submissions.

| ID | Language | Source File | Compiler Command (`compile_cmd`) | Execution Command (`run_cmd`) |
| :--- | :--- | :--- | :--- | :--- |
| **46** | Bash (5.0.0) | `script.sh` | *None* | `/usr/local/bash-5.0/bin/bash script.sh` |
| **50** | C (GCC 9.2.0) | `main.c` | `/usr/local/gcc-9.2.0/bin/gcc %s main.c` | `./a.out` |
| **51** | C# (Mono 6.6.0.161) | `Main.cs` | `/usr/local/mono-6.6.0.161/bin/mcs %s Main.cs` | `/usr/local/mono-6.6.0.161/bin/mono Main.exe` |
| **54** | C++ (GCC 9.2.0) | `main.cpp` | `/usr/local/gcc-9.2.0/bin/g++ %s main.cpp` | `LD_LIBRARY_PATH=/usr/local/gcc-9.2.0/lib64 ./a.out` |
| **60** | Go (1.13.5) | `main.go` | `GOCACHE=/tmp/.cache/go-build /usr/local/go-1.13.5/bin/go build %s main.go` | `./main` |
| **62** | Java (OpenJDK 13.0.1) | `Main.java` | `/usr/local/openjdk13/bin/javac %s Main.java` | `/usr/local/openjdk13/bin/java -cp ".:/usr/local/lib/mysql-connector.jar" Main` (Supports MySQL JDBC) |
| **63** | JavaScript (Node.js 12.14.0) | `script.js` | *None* | `/usr/local/node-12.14.0/bin/node script.js` |
| **71** | Python (3.8.1) | `script.py` | *None* | `/usr/local/python-3.8.1/bin/python3 script.py` |
| **74** | TypeScript (3.7.4) | `script.ts` | `/usr/bin/tsc %s script.ts` | `/usr/local/node-12.14.0/bin/node script.js` |
