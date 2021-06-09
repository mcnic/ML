(* val a = 34;
a = 5;
val a = 5; *)

fun pow(x: int, y: int) =
    if y=0
    then 1
    else x * pow(x, y-1)


val p2 = pow(2, 3)

fun cube(x: int) = 
    pow(x, 3)

val a = cube(3)

val c = cube 2

val d = (2,3)
val e = pow d

fun pow2(x: int, y: int) =
    if y=0
    then "s"
    else "y-1"