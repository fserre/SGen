#!/bin/bash
PARALLEL=32
REPORT_FILE="test-report.xml"
STATUS_DIR="$(mktemp -d)"
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

run_project() {
  local project="$1"
  cd "$project"
  echo "create_clock -name Clock -period 1 [get_ports clk]" > clock.xdc
  deps=""
  for dep in *.vhdl
  do
    [ -f "$dep" ] || continue
    deps+="read_vhdl ./$dep"
    deps+=\\$'\n'
  done
  sed "s/{{project}}/test.v/;s/{{XILINX_PART}}/$XILINX_PART/;s#{{deps}}#$deps#" ../synth.tcl > current.tcl
  rc=0
  for repeat in {1..3}; do
    res=$(timeout 1800 vivado -source current.tcl -mode batch -notrace 2>&1) || rc=$?
    if [ $rc -eq 0 ] && ! grep -q "ERROR" <<< "$res"; then
      ((repeat > 1)) && echo "Synthesis for $project eventually succeeded."
      break
    fi
    echo "Retrying synthesis for $project (attempt $repeat)..."
  done
  echo "$res" > "output.txt"
  cd ..
}

for project in "${projects[@]}"
do
  (run_project "$project") &
  while [[ $(jobs -r -p | wc -l) -ge $PARALLEL ]]; do
    sleep 10
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
      finish_epoch=$(( $(date +%s) + remaining ))
      finish_time=$(date -d "@$finish_epoch" "+%H:%M:%S")
      printf "Estimated remaining time: %02d:%02d:%02d (finish ~ %s) (%d/%d done)\n" "$h" "$m" "$s" "$finish_time" "$done" "$total"
    fi
  fi
done
echo "Waiting for remaining jobs to finish..."
wait
echo "Compiling results..."
echo "design, period, slices, dsps, ram, power" > results.csv
warnings=0
failures=0
report=""
for project in "${projects[@]}"
do
  report+="  <testcase classname=\"synthesis\" name=\"$project\">"
  if [ -f "$project/output.txt" ] && ! grep -q "ERROR" "$project/output.txt"; then
    res=$(<"$project/output.txt")
    diff=$(echo "$res" | awk -v RS='\0' '{sub(/^.*Worst slack: /, ""); sub(/[\n\r].*/,""); print}')
    period=$(awk "BEGIN {printf \"%.2f\",1.0 - $diff;}")
    slices=$(echo "$res" | awk -v RS='\0' '{sub(/^.*\| Slice *\| */, ""); sub(/ *\|.*/,""); print}')
    dsps=$(echo "$res" | awk -v RS='\0' '{sub(/Command: report_power.*/,""); sub(/^.*?\| DSPs *\| */, ""); sub(/ *\|.*/,""); print}')
    ram=$(echo "$res" | awk -v RS='\0' '{sub(/^.*\| Block RAM Tile *\| */, ""); sub(/ *\|.*/,""); print}')
    power=$(echo "$res" | awk -v RS='\0' '{sub(/^.*\| Total On\-Chip Power \(W\) *\| */, "");sub(/ *\|.*/,""); print}')
    echo "$project, $period, $slices, $dsps, $ram, $power" >> results.csv
    if grep -q "^$project" expected.csv; then
      expectedDsps=$(grep "^$project" expected.csv | awk -F, '{gsub(/ /, "", $4); printf($4);}')
      expectedRam=$(grep "^$project" expected.csv | awk -F, '{gsub(/ /, "", $5); printf($5);}')
      if (( "$expectedDsps" != "$dsps" )); then
        if (( "$expectedDsps" < "$dsps" )); then
          report+="    <failure message=\"Number of DSPs higher than expected\">Number of DSPs ($dsps) higher than expected ($expectedDsps) for $project!</failure>"
          echo "Regression: Higher number of DSPs for $project"
          failures=$((failures + 1))
        else
          report+="    <failure message=\"Number of DSPs lower than expected\">Number of DSPs ($dsps) lower than expected ($expectedDsps) for $project!</failure>"
          warnings=$((warnings + 1))
        fi
      fi
      if (( "$expectedRam" != "$ram" )); then
        if (( "$expectedRam" < "$ram" )); then
          report+="    <failure message=\"Number of RAMs higher than expected\">Number of RAMs ($ram) higher than expected ($expectedRam) for $project!</failure>"
          echo "Regression: Higher number of DSPs for $project"
          failures=$((failures + 1))
        else
          report+="    <failure message=\"Number of RAMs lower than expected\">Number of RAMs ($ram) lower than expected ($expectedRam) for $project!</failure>"
          warnings=$((warnings + 1))
        fi
      fi
    fi
  else
    if grep -q "^$project" expected.csv; then
      failures=$((failures + 1))
      echo "Regression: Synthesis for $project used to work, but failed."
      report+="    <failure message=\"Synthesis failed\">Synthesis of $project was expected to work, but failed!</failure>"
    else
      warnings=$((warnings + 1))
      report+="    <failure message=\"Synthesis failed\">Synthesis of $project is still failing.</failure>"
    fi
  fi
  report+="  </testcase>"
done

rm -rf "$STATUS_DIR"

{
  echo '<?xml version="1.0" encoding="UTF-8"?>'
  echo "<testsuite name=\"Simulation\" tests=\"$total\" failures=\"$failures\">"
  echo "$report"
  echo "</testsuite>"
} > "$REPORT_FILE"

if [[ "$failures" -gt 0 ]]; then
  exit 1
fi
if [[ "$warnings" -gt 0 ]]; then
  exit 127
fi

