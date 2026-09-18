from pathlib import Path

result_file = Path("gold_result.txt")

if not result_file.exists():
    raise SystemExit("ERROR: gold_result.txt was not found")

data = {}

for line in result_file.read_text().splitlines():
    if "=" in line:
        key, value = line.split("=", 1)
        data[key.strip()] = value.strip()

batch = data["BATCH"]
ore_tonnes = float(data["ORE_TONNES"])
gold_grade = float(data["GOLD_GRADE"])
recovery = float(data["RECOVERY_RATE"])
contained = float(data["CONTAINED_GRAMS"])
recovered = float(data["RECOVERED_GRAMS"])
ounces = float(data["RECOVERED_OUNCES"])

lost_grams = contained - recovered

if recovery >= 85:
    state = "CALM"
    action = "MAINTAIN NORMAL OPERATION"
elif recovery >= 70:
    state = "DEGRADED"
    action = "CHECK PROCESSING EFFICIENCY"
else:
    state = "UNDER STRESS"
    action = "INVESTIGATE RECOVERY LOSS"

report = f"""
GILDRA LEGACY MINING AWARENESS
--------------------------------
Batch: {batch}
Ore processed: {ore_tonnes:.2f} tonnes
Gold grade: {gold_grade:.2f} g/t
Recovery rate: {recovery:.2f}%
Recovered gold: {recovered:.2f} grams
Recovered gold: {ounces:.2f} troy ounces
Unrecovered gold: {lost_grams:.2f} grams
System state: {state}
Recommended action: {action}
""".strip()

print(report)

Path("awareness_report.txt").write_text(report + "\n")
