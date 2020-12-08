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
