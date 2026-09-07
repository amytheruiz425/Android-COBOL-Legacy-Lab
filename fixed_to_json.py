import json
from pathlib import Path

input_path = Path("system_records.txt")
output_path = Path("system_record.json")

record = input_path.read_text().splitlines()[0]

if len(record) != 12:
    raise ValueError(
        f"Expected a 12-character record, received {len(record)}"
    )

system_id = record[0:6]
health_text = record[6:9]
incidents_text = record[9:11]
alert = record[11]

if not health_text.isdigit():
    raise ValueError("Health field must be numeric")

if not incidents_text.isdigit():
    raise ValueError("Incident field must be numeric")

payload = {
    "system": system_id,
    "health": int(health_text),
    "incidents": int(incidents_text),
    "alert": alert,
}

output_path.write_text(
    json.dumps(payload, indent=2) + "\n"
)

print("LEGACY RECORD CONVERTED TO JSON")
print(output_path.read_text())
