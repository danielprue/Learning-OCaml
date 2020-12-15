# Explanation and Examples

This code is a solution for the problem found [here](https://adventofcode.com/2020/day/15)

# Strategy

* I want to use the strategy I used last time, where use an array as a hashmap, where the index in the key.
* The key will be the values in the list, and the values will be a list of positions that value was called in.
* I will start by buffering the array with the input list. After that, I will need the current value to look up what the next value should be
* Now loop until the counter is the last value we want (2020 for part 1 and 30000000 for part 2)
* On each loop, look up the current value.
  * If that value has an empty list, next value will be 0
  * If that value has a list, next value will be current value of counter - last value in that list
* In either case, add the counter value to the end of the list in that array address
* At the end of your loop, the current value is our return

# Conclusions

* I used the last things I learned a ton here, like using the Array as a pseudo hashmap, and putting functions inside bigger functions.
* I hit a few issues with typing, where the implicit typing suggested my `int` should be an `int list` (or vice versa), and I never did figure out where that was coming from, so I used a hack-y fix to make it work
* I made some extra effort in part 1 to make this scaleable to any input or counter length, and it really paid off when I was doing more of the same in part 2
