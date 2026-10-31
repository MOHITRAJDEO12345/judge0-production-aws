-- =============================================================================
-- Judge0 Custom Language Seed File
-- =============================================================================
-- This file is the SINGLE SOURCE OF TRUTH for all custom language configurations.
-- It runs against PostgreSQL on every deployment to ensure language settings
-- are always correct, even after a database wipe.
--
-- HOW TO ADD A NEW LANGUAGE:
--   1. Add the binary to Dockerfile.jdbc (e.g., RUN apt-get install ...)
--   2. Add an INSERT or UPDATE statement below
--   3. Add a test submission in deploy.yml
--   4. git push — CI/CD handles the rest
--
-- SAFE TO RE-RUN: All statements use UPDATE (idempotent) or
-- INSERT ... ON CONFLICT (upsert) so running this multiple times is harmless.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- Language ID 62: Java (OpenJDK 13.0.1) — JDBC MySQL Classpath
-- ---------------------------------------------------------------------------
-- Modifies the default Java compile/run commands to include the MySQL
-- JDBC connector JAR in the classpath, enabling database connectivity
-- from student submissions.
UPDATE languages SET
  compile_cmd = '/usr/local/openjdk13/bin/javac -cp "./:/usr/local/lib/mysql-connector.jar" %s Main.java',
  run_cmd = '/usr/local/openjdk13/bin/java -cp "./:/usr/local/lib/mysql-connector.jar" Main'
WHERE id = 62;

-- ---------------------------------------------------------------------------
-- Language ID 201: C (GCC 14)
-- ---------------------------------------------------------------------------
INSERT INTO languages (id, name, compile_cmd, run_cmd, source_file, is_archived)
VALUES (
  201,
  'C (GCC 14)',
  '/usr/local/gcc14/bin/gcc -O3 %s main.c -lm -o a.out',
  'LD_LIBRARY_PATH=/usr/local/gcc14/lib64 ./a.out',
  'main.c',
  false
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  compile_cmd = EXCLUDED.compile_cmd,
  run_cmd = EXCLUDED.run_cmd,
  source_file = EXCLUDED.source_file,
  is_archived = EXCLUDED.is_archived;

-- ---------------------------------------------------------------------------
-- Language ID 202: C++ (GCC 14)
-- ---------------------------------------------------------------------------
INSERT INTO languages (id, name, compile_cmd, run_cmd, source_file, is_archived)
VALUES (
  202,
  'C++ (GCC 14)',
  '/usr/local/gcc14/bin/g++ -O3 %s main.cpp -lm -o a.out',
  'LD_LIBRARY_PATH=/usr/local/gcc14/lib64 ./a.out',
  'main.cpp',
  false
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  compile_cmd = EXCLUDED.compile_cmd,
  run_cmd = EXCLUDED.run_cmd,
  source_file = EXCLUDED.source_file,
  is_archived = EXCLUDED.is_archived;

-- ---------------------------------------------------------------------------
-- Language ID 203: Java (OpenJDK 17) — JDBC MySQL Classpath
-- ---------------------------------------------------------------------------
INSERT INTO languages (id, name, compile_cmd, run_cmd, source_file, is_archived)
VALUES (
  203,
  'Java (OpenJDK 17)',
  '/usr/local/openjdk17/bin/javac -cp "./:/usr/local/lib/mysql-connector.jar" %s Main.java',
  '/usr/local/openjdk17/bin/java -cp "./:/usr/local/lib/mysql-connector.jar" Main',
  'Main.java',
  false
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  compile_cmd = EXCLUDED.compile_cmd,
  run_cmd = EXCLUDED.run_cmd,
  source_file = EXCLUDED.source_file,
  is_archived = EXCLUDED.is_archived;

-- ---------------------------------------------------------------------------
-- Language ID 204: Python (3.11)
-- ---------------------------------------------------------------------------
INSERT INTO languages (id, name, compile_cmd, run_cmd, source_file, is_archived)
VALUES (
  204,
  'Python (3.11)',
  '/usr/local/python-3.11/bin/python3 -m py_compile %s script.py',
  '/usr/local/python-3.11/bin/python3 script.py',
  'script.py',
  false
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  compile_cmd = EXCLUDED.compile_cmd,
  run_cmd = EXCLUDED.run_cmd,
  source_file = EXCLUDED.source_file,
  is_archived = EXCLUDED.is_archived;

-- ---------------------------------------------------------------------------
-- Language ID 205: Java (OpenJDK 21) — JDBC MySQL Classpath
-- ---------------------------------------------------------------------------
INSERT INTO languages (id, name, compile_cmd, run_cmd, source_file, is_archived)
VALUES (
  205,
  'Java (OpenJDK 21)',
  '/usr/local/openjdk21/bin/javac -cp "./:/usr/local/lib/mysql-connector.jar" %s Main.java',
  '/usr/local/openjdk21/bin/java -cp "./:/usr/local/lib/mysql-connector.jar" Main',
  'Main.java',
  false
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  compile_cmd = EXCLUDED.compile_cmd,
  run_cmd = EXCLUDED.run_cmd,
  source_file = EXCLUDED.source_file,
  is_archived = EXCLUDED.is_archived;

-- ---------------------------------------------------------------------------
-- Language ID 206: JavaScript (Node.js 22)
-- ---------------------------------------------------------------------------
INSERT INTO languages (id, name, run_cmd, source_file, is_archived)
VALUES (
  206,
  'JavaScript (Node.js 22)',
  '/usr/local/node-v22/bin/node script.js',
  'script.js',
  false
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  compile_cmd = EXCLUDED.compile_cmd,
  run_cmd = EXCLUDED.run_cmd,
  source_file = EXCLUDED.source_file,
  is_archived = EXCLUDED.is_archived;

-- ---------------------------------------------------------------------------
-- Language ID 207: TypeScript (Node.js 22)
-- ---------------------------------------------------------------------------
INSERT INTO languages (id, name, compile_cmd, run_cmd, source_file, is_archived)
VALUES (
  207,
  'TypeScript (Node.js 22)',
  '/usr/local/node-v22/bin/node /usr/local/node-v22/lib/node_modules/typescript/lib/tsc.js %s script.ts',
  '/usr/local/node-v22/bin/node script.js',
  'script.ts',
  false
)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  compile_cmd = EXCLUDED.compile_cmd,
  run_cmd = EXCLUDED.run_cmd,
  source_file = EXCLUDED.source_file,
  is_archived = EXCLUDED.is_archived;


