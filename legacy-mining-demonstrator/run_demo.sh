#!/usr/bin/env bash

set -e

echo "========================================"
echo " GILDRA LEGACY MINING DEMONSTRATOR"
echo " COBOL + FORTRAN + PYTHON ON ANDROID"
echo "========================================"

echo
echo "[1/5] Compiling COBOL producer..."
cobc -x -free ore_batch.cob -o ore_batch

echo "[2/5] Compiling FORTRAN analyzer..."
lfortran gold_analyzer.f90 -o gold_analyzer

echo "[3/5] COBOL creating ore batch..."
./ore_batch

echo
echo "[4/5] FORTRAN analyzing gold recovery..."
./gold_analyzer

echo
echo "[5/5] Gildra interpreting system state..."
python mining_awareness.py

echo
echo "========================================"
echo " DEMONSTRATION COMPLETE"
echo "========================================"
