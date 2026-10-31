# /tmp/patch_languages.rb
# This script is executed during the Docker build process to permanently
# inject the new Language IDs directly into Judge0's core Ruby source code.

active_file = '/api/db/languages/active.rb'

# 1. We must read the file and evaluate the array so we can manipulate it
# But active.rb just does `@languages ||= []\n@languages +=\n[...]`
# To safely append, we will just parse the file as a string, find the last closing bracket,
# and insert our new hashes right before it.

content = File.read(active_file)

# The new languages to inject (using Ruby hash syntax)
new_languages = <<~RUBY
  ,
  {
    id: 201,
    name: "C (GCC 14)",
    is_archived: false,
    source_file: "main.c",
    compile_cmd: "/usr/local/gcc14/bin/gcc -O3 %s main.c -lm -o a.out",
    run_cmd: "LD_LIBRARY_PATH=/usr/local/gcc14/lib64 ./a.out"
  },
  {
    id: 202,
    name: "C++ (GCC 14)",
    is_archived: false,
    source_file: "main.cpp",
    compile_cmd: "/usr/local/gcc14/bin/g++ -O3 %s main.cpp -lm -o a.out",
    run_cmd: "LD_LIBRARY_PATH=/usr/local/gcc14/lib64 ./a.out"
  },
  {
    id: 203,
    name: "Java (OpenJDK 17)",
    is_archived: false,
    source_file: "Main.java",
    compile_cmd: "/usr/local/openjdk17/bin/javac -cp \\"./:/usr/local/lib/mysql-connector.jar\\" %s Main.java",
    run_cmd: "/usr/local/openjdk17/bin/java -cp \\"./:/usr/local/lib/mysql-connector.jar\\" Main"
  },
  {
    id: 204,
    name: "Python (3.11)",
    is_archived: false,
    source_file: "script.py",
    compile_cmd: "/usr/local/python-3.11/bin/python3 -m py_compile %s script.py",
    run_cmd: "/usr/local/python-3.11/bin/python3 script.py"
  },
  {
    id: 205,
    name: "Java (OpenJDK 21)",
    is_archived: false,
    source_file: "Main.java",
    compile_cmd: "/usr/local/openjdk21/bin/javac -cp \\"./:/usr/local/lib/mysql-connector.jar\\" %s Main.java",
    run_cmd: "/usr/local/openjdk21/bin/java -cp \\"./:/usr/local/lib/mysql-connector.jar\\" Main"
  },
  {
    id: 206,
    name: "JavaScript (Node.js 22)",
    is_archived: false,
    source_file: "script.js",
    run_cmd: "/usr/local/node-v22/bin/node script.js"
  },
  {
    id: 207,
    name: "TypeScript (Node.js 22)",
    is_archived: false,
    source_file: "script.ts",
    compile_cmd: "/usr/local/node-v22/bin/node /usr/local/node-v22/lib/node_modules/typescript/lib/tsc.js %s script.ts",
    run_cmd: "/usr/local/node-v22/bin/node script.js"
  }
RUBY

# We also need to patch Java 62 in-place.
# Find the hash for ID 62 and replace compile_cmd and run_cmd
content.gsub!(
  /compile_cmd:\s*"\/usr\/local\/openjdk13\/bin\/javac %s Main\.java"/,
  'compile_cmd: "/usr/local/openjdk13/bin/javac -cp \"./:/usr/local/lib/mysql-connector.jar\" %s Main.java"'
)

content.gsub!(
  /run_cmd:\s*"\/usr\/local\/openjdk13\/bin\/java Main"/,
  'run_cmd: "/usr/local/openjdk13/bin/java -cp \"./:/usr/local/lib/mysql-connector.jar\" Main"'
)

# Find the last closing bracket "]"
last_bracket_index = content.rindex(']')

if last_bracket_index
  # Insert our new languages right before the last bracket
  content.insert(last_bracket_index, new_languages)
  File.write(active_file, content)
  puts "Successfully patched #{active_file} with new languages!"
else
  puts "ERROR: Could not find closing bracket in #{active_file}"
  exit 1
end
