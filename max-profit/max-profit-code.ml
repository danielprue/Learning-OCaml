(*
    FIRST PASS SOLUTION
*)

(* function for finding max int in a list *)

let rec min least prices = 
    match prices with
    | [] -> 0
    | x :: [] -> x
    | x :: xs -> 
        let v = min least xs in
        if x < v then
            x
        else
            v

(* function for finding min int in a list *)

let rec max most prices = 
    match prices with
    | [] -> 0
    | x :: [] -> x
    | x :: xs -> 
        let v = max most xs in
        if x > v then
            x
        else
            v

(* function for turning a list into a list of lists as described in my other file *)

let rec break_list prices current_min current_list all_lists = 
    match prices with
    | [] -> [current_list] @all_lists
    | x :: xs -> 
        if x < current_min then
            break_list prices x [] ([current_list]@all_lists) 
        else
            break_list xs current_min ([x]@current_list) all_lists
            
(* function for calculating each max profit for a sub-list, then bubbling the largest to the top *)

let rec find_profits formatted_prices current_max = 
    match formatted_prices with
    | [] -> current_max
    | x :: xs ->
        let profit = max max_int x - min min_int x in
        if profit > current_max then
            find_profits xs profit
        else
            find_profits xs current_max
            
 (* function to kick of process *)
 
 let find_max_profit prices =
    let formatted_prices = break_list prices (List.hd prices) [] [] in
    find_profits formatted_prices 0


(*
    SECOND IMPROVED SOLUTION
*)

let rec max_profits prices current_max current_min current_max_profit = 
    match prices with
    | [] -> current_max_profit
    | x :: xs -> 
        if x < current_min then
            max_profits xs x x current_max_profit
        else if x > current_max then
            let a = (if current_max_profit > (x - current_min) then current_max_profit else (x - current_min)) in
            max_profits xs x current_min a
        else 
            max_profits xs current_max current_min current_max_profit
            
(* some sample tests *)

let example_list = [6;3;1;2;5;4] (* should be 4 *)
let example_list2 = [18;74;69;100;71;10;8;13;86;9;56;76;70;29;17;33;55;44;82;48] (* should be 82 *)
let example_list3 = [98;35;94;48;19;53;32;35;11;50;27;6;83;70;24;90;21;61;65;42] (* should be 84 *)

let () = print_endline (string_of_int (max_profits example_list (List.hd example_list) (List.hd example_list) 0))
let () = print_endline (string_of_int (max_profits example_list2 (List.hd example_list2) (List.hd example_list2) 0))
let () = print_endline (string_of_int (max_profits example_list3 (List.hd example_list3) (List.hd example_list3) 0))            
