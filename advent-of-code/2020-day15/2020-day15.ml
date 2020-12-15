let input = [16;12;1;0;15;7;11]
let length_check = 30000000

let memory_game input_list = 
    let counter = Array.make length_check [] in
    (* Fill our new array with the starter list *)
    let rec fill_counter_with_input current_list current_number =
        match current_list with
        | [] -> 0
        | hd :: [] -> hd
        | hd :: tl ->
            Array.set counter hd (current_number@counter.(hd));
            fill_counter_with_input tl [((List.hd current_number) + 1)]
    in
    let last_number = fill_counter_with_input input_list [1] in
    
    (* Predict numbers up to 2020 *)
    let rec next_number prev_number count = 
        let next = if counter.(prev_number) == [] then 0 else (count - (List.hd counter.(prev_number))) in
        Array.set counter prev_number ([count]@counter.(prev_number));
        if count == (length_check - 1) then next
        else next_number next (count + 1)
    in
    let twenty_twenty = next_number last_number (List.length input_list) in
    print_int twenty_twenty;;    
        
memory_game input
