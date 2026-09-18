program gold_analyzer
    implicit none

    character(len=8) :: batch_id
    real :: ore_tonnes
    real :: gold_grade
    real :: recovery_rate
    real :: contained_grams
    real :: recovered_grams
    real :: recovered_ounces
    integer :: io_status

    open(unit=10, file="ore_batch.txt", status="old", &
         action="read", iostat=io_status)

    if (io_status /= 0) then
        print *, "ERROR: COULD NOT OPEN ORE BATCH"
        stop
    end if

    read(10, *, iostat=io_status) batch_id, ore_tonnes, &
                                  gold_grade, recovery_rate
    close(10)

    if (io_status /= 0) then
        print *, "ERROR: INVALID ORE BATCH"
        stop
    end if

    contained_grams = ore_tonnes * gold_grade
    recovered_grams = contained_grams * (recovery_rate / 100.0)
    recovered_ounces = recovered_grams / 31.1034768

    open(unit=20, file="gold_result.txt", status="replace", &
         action="write")

    write(20, '(A,A)') "BATCH=", trim(batch_id)
    write(20, '(A,F10.2)') "ORE_TONNES=", ore_tonnes
    write(20, '(A,F10.2)') "GOLD_GRADE=", gold_grade
    write(20, '(A,F10.2)') "RECOVERY_RATE=", recovery_rate
    write(20, '(A,F10.2)') "CONTAINED_GRAMS=", contained_grams
    write(20, '(A,F10.2)') "RECOVERED_GRAMS=", recovered_grams
    write(20, '(A,F10.2)') "RECOVERED_OUNCES=", recovered_ounces

    close(20)

    print *, "FORTRAN GOLD ANALYSIS COMPLETE"
    print *, "Batch:", batch_id
    print *, "Contained gold:", contained_grams, "grams"
    print *, "Recovered gold:", recovered_grams, "grams"
    print *, "Recovered gold:", recovered_ounces, "troy ounces"

end program gold_analyzer
