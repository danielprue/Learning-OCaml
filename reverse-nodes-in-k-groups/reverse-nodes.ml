(* print list function for checking solutions *)

let rec printList list = 
    match list with
    | [] -> print_char '\n'
    | x :: xs -> 
        print_int x; print_char ' ';
        printList xs


(* Main function *)

let rec reverseNodesInKGroups array k temp output = 
    match array with
    (* base case -- array is empty *)
    | [] -> (output @ (List.rev temp) )
    | x :: xs -> 
        if ((List.length temp) == k) then begin
            (* temp is full: append it to output and empty temp *)
            reverseNodesInKGroups array k [] (output@temp)
        end else
            (* pop the head from array and add it to the front of temp *)
            reverseNodesInKGroups xs k ([x]@temp) output
            
            
(* test cases *)   

let example1_List = [1;2;3;4;5]
let example1_k = 2;;

let example2_List = [1;2;3;4;5;6;7;8;9;10;11]
let example2_k = 3;;

printList (reverseNodesInKGroups example1_List example1_k [] []);
printList (reverseNodesInKGroups example2_List example2_k [] []);
