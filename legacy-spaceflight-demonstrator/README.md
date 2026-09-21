# Legacy Spaceflight Demonstrator

A working educational demonstration of COBOL, FORTRAN, Python, and Android operating together as a spaceflight telemetry system.

Built entirely on an Android phone using Termux.

## Purpose

This project demonstrates how proven legacy languages can cooperate with modern technology:

- COBOL records structured mission telemetry.
- FORTRAN performs orbital calculations.
- Python adds a Gildra-style awareness layer.
- Android provides the portable computing environment.

## Architecture

```text
COBOL telemetry producer
          |
          v
mission_telemetry.txt
          |
          v
FORTRAN orbital analyzer
          |
          v
flight_result.txt
          |
          v
Python/Gildra awareness
          |
          v
CALM, DEGRADED, or UNDER STRESS
```

## Project Files

- `mission_telemetry.cob` — creates the fictional mission record
- `orbit_analyzer.f90` — performs simplified orbital calculations
- `flight_awareness.py` — interprets mission condition
- `run_mission.sh` — compiles and executes the complete system
- `.gitignore` — excludes executables and generated reports

## Example Telemetry

```text
Mission: MISSION01
Altitude: 185.00 km
Measured velocity: 7.75 km/s
Fuel remaining: 62.00%
Temperature: 48.00 C
```

## Orbital Calculations

FORTRAN calculates orbital radius:

```text
Orbital radius = Earth radius + spacecraft altitude
```

Expected circular-orbit velocity:

```text
Velocity = square root of (Earth gravitational parameter / orbital radius)
```

Orbital period:

```text
Period = 2 × pi × square root of
         (orbital radius cubed / Earth gravitational parameter)
```

## Example Result

```text
Expected velocity: 7.797 km/s
Measured velocity: 7.750 km/s
Velocity deviation: 0.047 km/s
Orbital period: 88.05 minutes
Mission state: CALM
Recommended action: CONTINUE MISSION OBSERVATION
```

## Requirements

Install Termux from F-Droid, then install:

```bash
pkg install gnucobol
pkg install lfortran
pkg install python
```

## Run the Demonstration

```bash
chmod +x run_mission.sh
./run_mission.sh
```

The script compiles both legacy-language programs before running the complete five-stage demonstration.

## Important Limitation

This is an educational software demonstrator using fictional telemetry and simplified circular-orbit mathematics. Its awareness thresholds are demonstration values. It is not certified flight software and must not be used for actual spacecraft navigation or operational decisions.

## Gildra Legacy Awareness

The project demonstrates the Gildra principle of adding context, interpretation, and operational meaning without discarding proven legacy technology.

**Legacy — let the legend continue beyond.**
