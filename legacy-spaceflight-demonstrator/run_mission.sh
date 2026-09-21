#!/usr/bin/env bash

set -e

echo "============================================"
echo " GILDRA LEGACY SPACEFLIGHT DEMONSTRATOR"
echo " COBOL + FORTRAN + PYTHON ON ANDROID"
echo "============================================"

echo
echo "[1/5] Compiling COBOL telemetry producer..."
cobc -x -free mission_telemetry.cob -o mission_telemetry

echo "[2/5] Compiling FORTRAN orbital analyzer..."
lfortran orbit_analyzer.f90 -o orbit_analyzer

echo "[3/5] COBOL creating mission telemetry..."
./mission_telemetry

echo
echo "[4/5] FORTRAN performing orbital analysis..."
./orbit_analyzer

echo
echo "[5/5] Gildra interpreting mission state..."
python flight_awareness.py

echo
echo "============================================"
echo " SPACEFLIGHT DEMONSTRATION COMPLETE"
echo "============================================"
