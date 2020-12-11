# Explanation and Examples
This code is a solution for part 2 found [here](https://adventofcode.com/2020/day/10)

# Strategy

* Use recursion to find every branching combination
* Starting at 0 jolts, recursively call the function on current_jolts +1, +2, +3 added together.
* Base case is reaching the adapter with the highest jolts (163), so if our current jolts is equal to that, return 1.
* If our set of adapters does not contain current_jolts, then this combination is not valid, so return 0
* After running this solution for the first time, I noticed that I was trying to do something around 3^163 function calls which is too many
* Added memoization to record the solution for certain values so we can look them up later, dramatically reducing the number of function calls.

# Conclusions

* This is the first time I've read a file with OCaml. I had to look up how to do parts of it.
* The base recursive algorithm was pretty intuitve, but I had a lot of trouble figuring out the memoization, and evenutally had to look that up. 
I was trying to figure out how to pass a recursively changing map, but the solution ended up being an array with a recursive function inside the base function
* I learned how to build a set for the first time using the Set.S module type.
