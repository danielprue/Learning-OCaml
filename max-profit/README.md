# Explanation:

You are given the prices of a stock, in the form of an array of integers, `prices`. Let's say that `prices[i]` is the price of the stock on the `ith` day (0-based index). 
Assuming that you are allowed to buy and sell the stock only once, your task is to find the maximum possible profit (the difference between the buy and sell prices).
Note: You can assume there are no fees associated with buying or selling the stock.

# Example:

* For `prices = [6, 3, 1, 2, 5, 4]`, the output should be `buyAndSellStock(prices) = 4`.
It would be most profitable to buy the stock on day 2 and sell it on day 4. Thus, the maximum profit is `prices[4] - prices[2] = 5 - 1 = 4`.

* For `prices = [8, 5, 3, 1]`, the output should be `buyAndSellStock(prices) = 0`.
Since the value of the stock drops each day, there's no way to make a profit from selling it. Hence, the maximum profit is 0.

* For `prices = [3, 100, 1, 97]`, the output should be `buyAndSellStock(prices) = 97`.
It would be most profitable to buy the stock on day 0 and sell it on day 1. Thus, the maximum profit is `prices[1] - prices[0] = 100 - 3 = 97`.

# Strategy:
* I want to buy low and sell high, so I need to find a way of matching the min values with the max values from the list of prices
* I need to preserve the order of the list, and make sure I only sell after I buy, so I can't simply take `max(prices) - min(prices)`
* I can do pairwise comparisons of every value in the list - every value after it in the list. This is a `O(n^2)` solution.
* I can also solve this in `O(n)` time, by keeping a running total of the mins and the maxes, and calculating the profit every time there is a new max.
* By splitting the list into a list of lists whenever there is a new min, I can take the `max - min` of each sublist and take the largest profit from each sublist.
* After making this solution, I realized that it was overkill, and I can simply recursively track the max and min values for buying and selling. I can only sell after I buy,
so if I do reset my buy price, I have to also reset my sell price so it is always after my buy. Whenever I update my sell price, I need to calculate a profit and compare it
with the max profit so far

# Conclusions:
* This is the first time I've really used pattern matching, and it is awesome for recursive list manipulation
* The functional programming toolkit sometimes feels so different from OOP that I overthink things. I'm glad I stuck around to get my second solution, because my first was
a bit too complex.
