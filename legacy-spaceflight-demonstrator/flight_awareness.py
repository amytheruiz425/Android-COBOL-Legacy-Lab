from pathlib import Path

result_file = Path("flight_result.txt")

if not result_file.exists():
    raise SystemExit("ERROR: flight_result.txt was not found")

data = {}

for line in result_file.read_text().splitlines():
    if "=" in line:
        key, value = line.split("=", 1)
        data[key.strip()] = value.strip()

mission = data["MISSION"]
altitude = float(data["ALTITUDE_KM"])
measured_velocity = float(data["MEASURED_VELOCITY"])
expected_velocity = float(data["EXPECTED_VELOCITY"])
velocity_deviation = float(data["VELOCITY_DEVIATION"])
orbital_period = float(data["ORBITAL_PERIOD_MIN"])
fuel = float(data["FUEL_PERCENT"])
temperature = float(data["TEMPERATURE_C"])

if fuel < 20 or temperature > 80 or velocity_deviation > 0.20:
    state = "UNDER STRESS"
    action = "INVESTIGATE MISSION TELEMETRY"
elif fuel < 40 or temperature > 60 or velocity_deviation > 0.10:
    state = "DEGRADED"
    action = "INCREASE MISSION OBSERVATION"
else:
    state = "CALM"
    action = "CONTINUE MISSION OBSERVATION"

deviation_mps = velocity_deviation * 1000

report = f"""
GILDRA LEGACY SPACEFLIGHT AWARENESS
-------------------------------------
Mission: {mission}
Altitude: {altitude:.2f} km
Measured velocity: {measured_velocity:.3f} km/s
Expected velocity: {expected_velocity:.3f} km/s
Velocity deviation: {velocity_deviation:.3f} km/s
Velocity deviation: {deviation_mps:.1f} m/s
Orbital period: {orbital_period:.2f} minutes
Fuel remaining: {fuel:.2f}%
Temperature: {temperature:.2f} C
Mission state: {state}
Recommended action: {action}
""".strip()

print(report)

Path("mission_report.txt").write_text(report + "\n")
