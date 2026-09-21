program orbit_analyzer
    implicit none

    real, parameter :: earth_radius_km = 6371.0
    real, parameter :: earth_mu = 398600.4418
    real, parameter :: pi = 3.14159265

    character(len=9) :: mission_id
    real :: altitude_km
    real :: measured_velocity
    real :: fuel_percent
    real :: temperature_c
    real :: orbital_radius
    real :: expected_velocity
    real :: velocity_deviation
    real :: orbital_period_seconds
    real :: orbital_period_minutes
    integer :: io_status

    open(unit=10, file="mission_telemetry.txt", status="old", &
         action="read", iostat=io_status)

    if (io_status /= 0) then
        print *, "ERROR: MISSION TELEMETRY NOT FOUND"
        stop
    end if

    read(10, *, iostat=io_status) mission_id, altitude_km, &
        measured_velocity, fuel_percent, temperature_c

    close(10)

    if (io_status /= 0) then
        print *, "ERROR: INVALID MISSION TELEMETRY"
        stop
    end if

    orbital_radius = earth_radius_km + altitude_km

    expected_velocity = sqrt(earth_mu / orbital_radius)

    velocity_deviation = abs(measured_velocity - expected_velocity)

    orbital_period_seconds = 2.0 * pi * &
        sqrt((orbital_radius ** 3) / earth_mu)

    orbital_period_minutes = orbital_period_seconds / 60.0

    open(unit=20, file="flight_result.txt", status="replace", &
         action="write")

    write(20, '(A,A)') "MISSION=", trim(mission_id)
    write(20, '(A,F10.2)') "ALTITUDE_KM=", altitude_km
    write(20, '(A,F10.3)') "MEASURED_VELOCITY=", measured_velocity
    write(20, '(A,F10.3)') "EXPECTED_VELOCITY=", expected_velocity
    write(20, '(A,F10.3)') "VELOCITY_DEVIATION=", velocity_deviation
    write(20, '(A,F10.2)') "ORBITAL_PERIOD_MIN=", orbital_period_minutes
    write(20, '(A,F10.2)') "FUEL_PERCENT=", fuel_percent
    write(20, '(A,F10.2)') "TEMPERATURE_C=", temperature_c

    close(20)

    print *, "FORTRAN ORBITAL ANALYSIS COMPLETE"
    print *, "Mission:", mission_id
    print *, "Orbital radius:", orbital_radius, "km"
    print *, "Expected velocity:", expected_velocity, "km/s"
    print *, "Measured velocity:", measured_velocity, "km/s"
    print *, "Velocity deviation:", velocity_deviation, "km/s"
    print *, "Orbital period:", orbital_period_minutes, "minutes"

end program orbit_analyzer
