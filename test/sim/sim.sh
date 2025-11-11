#!/bin/bash
set -euo pipefail

REPORT_FILE="test-report.xml"
PARALLEL=16
declare -A results

STATUS_DIR="$(mktemp -d)"

run_project() {
  local project="$1"
  local res=""
  cd "$project"
  for file in *.vhdl; do
    [ -f "$file" ] && res+=$(xvhdl "$file" 2>&1 || true)
  done
  res+=$(timeout 300 xvlog test.v 2>&1 || true)
  res+=$(timeout 300 xelab test 2>&1 || true)
  res+=$(timeout 300 xsim work.test -R 2>&1 || true)
  echo "$res" > "output.txt"
  [[ "$res" == *"Success."* ]] && echo success > "$STATUS_DIR/${project}.status" || echo failure > "$STATUS_DIR/${project}.status"
}

xml_escape() { sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g'; }

export -f run_project
export STATUS_DIR

projects=()
for d in *; do
  [ -d "$d" ] || continue
  projects+=("$d")
done
projects=( $(shuf -e "${projects[@]}") )

total=${#projects[@]}
start_time=$(date +%s)
done=-$PARALLEL

for project in "${projects[@]}"; do
  (run_project "$project") &
  while [[ $(jobs -r -p | wc -l) -ge $PARALLEL ]]; do
    sleep 1
  done
  done=$((done + 1))
  if (( done > 0 )); then
    elapsed=$(( $(date +%s) - start_time ))
    remaining_jobs=$(( total - done ))
    remaining=$(( remaining_jobs * elapsed / done ))
    if (( remaining > 0 )); then
      h=$(( remaining / 3600 ))
      m=$(( (remaining % 3600) / 60 ))
      s=$(( remaining % 60 ))
      printf "Estimated remaining time: %02d:%02d:%02d (%d/%d done)\n" "$h" "$m" "$s" "$done" "$total"
    fi
  fi
done
echo "Waiting for remaining jobs to finish..."
wait
echo "Compiling results..."

for project in "${projects[@]}"; do
  status="$STATUS_DIR/${project}.status"
  if [ -f "$status" ]; then
    results["$project"]="$(<"$status")"
  else
    results["$project"]="failure"
  fi
done

failures=0
for p in "${!results[@]}"; do
  if [[ "${results[$p]}" == failure ]]; then
    failures=$((failures + 1))
  fi
done



{
  echo '<?xml version="1.0" encoding="UTF-8"?>'
  echo "<testsuite name=\"Simulation\" tests=\"$total\" failures=\"$failures\">"
  for p in "${!results[@]}"; do
    status="${results[$p]}"
    echo "  <testcase classname=\"simulation\" name=\"$p\">"
    if [[ "$status" == failure ]]; then
      echo "    <failure message=\"Simulation failed\"></failure>"
    fi
    echo "  </testcase>"
  done
  echo "</testsuite>"
} > "$REPORT_FILE"
rm -rf "$STATUS_DIR"
if [[ $failures -gt 0 ]]; then
  echo -e "\e[31mFailures: $failures/$total\e[0m"
  exit 1
else
  echo -e "\e[32mAll $total simulations passed\e[0m"
fi
