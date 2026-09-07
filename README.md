# Android-COBOL-Legacy-Lab

A small COBOL telemetry project built and tested entirely on an Android phone using Termux, GnuCOBOL, and Python.

## Project Files

- incidents.cob: Demonstrates a COBOL incident counter.
- telemetry.cob: Writes health, incident, and alert data.
- telemetry_bridge.py: Reads the COBOL output and interprets the system state.
- telemetry.txt: Generated when the telemetry producer runs.

## Installation

Install the required tools in Termux:

    pkg update
    pkg install gnucobol python

## Incident Counter

Compile and run:

    cobc -x -free incidents.cob
    ./incidents

Expected output:

    BEFORE: 02
    AFTER:  03

## Telemetry Demonstration

Compile and run the COBOL producer:

    cobc -x -free telemetry.cob
    ./telemetry
    cat telemetry.txt

Expected telemetry:

    HEALTH=045
    INCIDENTS=03
    ALERT=A

Run the Python bridge:

    python telemetry_bridge.py

Expected interpretation:

    Interpreted State: UNDER_STRESS

## Purpose

This project demonstrates how COBOL and modern technology can work together through a simple telemetry file. It was created entirely on an Android phone as a practical legacy-system programming experiment.
## Legacy Lab Experiments

1. Incident Counter
2. Telemetry Producer, History, and Python Bridge
3. Fixed-Width Record Reader
4. Daily Reconciliation Report
5. Batch Transaction Validator
6. Checkpoint and Restart
7. Fixed-Width Record to JSON Bridge

Together, these experiments demonstrate how COBOL can run on Android, process traditional legacy records, preserve operational history, recover from interruptions, and exchange data with modern software.
