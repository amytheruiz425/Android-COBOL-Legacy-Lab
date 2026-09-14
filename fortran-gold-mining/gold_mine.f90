program gold_mine
    implicit none

    real :: ore_tonnes
    real :: grade
    real :: recovery_percent
    real :: contained_grams
    real :: recovered_grams
    real :: recovered_ounces

    print *, "GILDRA FORTRAN GOLD MINE CALCULATOR"

    print *, "Enter ore tonnes:"
    read *, ore_tonnes

    print *, "Enter gold grade in grams per tonne:"
    read *, grade

    print *, "Enter recovery percentage:"
    read *, recovery_percent

    contained_grams = ore_tonnes * grade
    recovered_grams = contained_grams * (recovery_percent / 100.0)
    recovered_ounces = recovered_grams / 31.1034768

    print *, "Contained gold in grams:", contained_grams
    print *, "Recovered gold in grams:", recovered_grams
    print *, "Recovered gold in troy ounces:", recovered_ounces

end program gold_mine
