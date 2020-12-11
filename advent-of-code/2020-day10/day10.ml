module Ints = Set.Make(Int)

let read_file filename =
    let lines = ref [] in 
    let chan = open_in filename in
    try
        while true; do
            lines := input_line chan :: !lines
        done; !lines
    with End_of_file ->
        close_in chan;
        List.rev !lines ;;

let file = read_file "./example.txt";;

let rec fill_set list set = 
    match list with
    | [] -> set
    | x :: xs ->
        fill_set xs (Ints.add (int_of_string x) set)

let find_combos current_jolts max_jolts set = 
    let memo: int option array = Array.make (max_jolts + 10) None in
    let rec f_mem(current_jolts) = 
        match memo.(current_jolts) with
        Some result -> result
        | None ->
        let result = if current_jolts == max_jolts then 1
        else if (not (Ints.mem current_jolts set)) then 0
        else f_mem(current_jolts + 1) + f_mem(current_jolts + 2) + f_mem(current_jolts + 3) in
            memo.(current_jolts) <- (Some result);
            result
    in
    f_mem(current_jolts)

let number_set = Ints.add 0 (fill_set file Ints.empty);;

print_int (find_combos 0 (Ints.max_elt number_set) number_set)
