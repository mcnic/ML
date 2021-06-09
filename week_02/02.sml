fun is_older(date1 : int*int*int, date2 : int*int*int) = 
    (#3 date1) + (#2 date1)*13 + (#1 date1)*400 < (#3 date2) + (#2 date2)*13 + (#1 date2)*400
    
fun number_in_month(lst_date : (int*int*int) list, num_month : int) =
    if null lst_date
    then 0
    else 
        if #2 (hd lst_date) = num_month
        then number_in_month(tl lst_date, num_month) + 1
        else number_in_month(tl lst_date, num_month)

fun number_in_months (lst_date : (int*int*int) list, lst_month : int list) =
    if null lst_month
    then 0
    else number_in_month(lst_date, hd lst_month) + number_in_months(lst_date, tl lst_month)

fun dates_in_month (lst_date : (int*int*int) list, num_month) = 
    if null lst_date
    then []
    else 
        if #2 (hd lst_date) = num_month
        then hd lst_date :: dates_in_month(tl lst_date, num_month)
        else dates_in_month(tl lst_date, num_month)

fun dates_in_months (lst_date : (int*int*int) list, lst_month : int list) = 
    if null lst_month
    then []
    else dates_in_month(lst_date, hd lst_month) @ dates_in_months(lst_date, tl lst_month)

fun get_nth (lst_str : string list, num : int) =
    let
        fun find_num(lst : string list, cnt : int) = 
            if cnt = num
            then hd lst
            else find_num(tl lst, cnt + 1)
    in
        find_num(lst_str, 1)
    end

fun date_to_string (year : int, month : int, day : int) =
    get_nth(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], month) ^ " " ^ Int.toString day ^ ", " ^ Int.toString year

fun number_before_reaching_sum (sum : int, lst : int list) =
    let
        fun add (lst : int list, acc : int, num : int) =
            if acc + (hd lst) >= sum
            then num - 1
            else add(tl lst, acc + (hd lst), num + 1)
    in
        add (lst, 0, 1)
    end

fun what_month (num : int) =
    number_before_reaching_sum(num, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) + 1

fun month_range (day1 : int, day2 : int) =
    let
        fun lst_month (day : int) =
            if day > day2
            then []
            else what_month(day) :: lst_month(day + 1)
    in
        lst_month(day1)
    end

fun oldest(lst_date : (int*int*int) list) =
    if null lst_date
    then NONE
    else
        let
            fun oldest_date (lst : (int*int*int) list, date: int*int*int) =
                if null lst
                then date
                else 
                    if is_older(date, hd lst)
                    then oldest_date(tl lst, date)
                    else oldest_date(tl lst, hd lst)
        in
            SOME(oldest_date(lst_date, (3000,1,1)))
        end