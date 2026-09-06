
from pathlib import Path

telemetry_path = Path("telemetry.txt")

telemetry = {}

for line in telemetry_path.read_text().splitlines():
    key, value = line.split("=", 1)
    telemetry[key] = value

health = int(telemetry["HEALTH"])
incidents = int(telemetry["INCIDENTS"])
alert = telemetry["ALERT"]

if health < 50 or alert == "A":
    state = "UNDER_STRESS"
elif health < 70:
    state = "DEGRADED"
else:
    state = "CALM"

print("COBOL TELEMETRY BRIDGE")
print(f"Health: {health}")
print(f"Incidents: {incidents}")
print(f"Alert: {alert}")
print(f"Interpreted State: {state}")
