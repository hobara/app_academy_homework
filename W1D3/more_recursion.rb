d## More recursion

# Range (num1...num2)
def recursive_range(start_num, end_num)
  return [] if start_num >= end_num
  recursive_range(start_num, end_num-1) << end_num - 1
end

# Sum
def iterative_sum(arr)
  sum = 0
  arr.each { |num| sum += num }
  sum
end

def recursive_sum(arr)
  return arr[0] if arr.length == 1
  num = arr.pop
  recursive_sum(arr) + num
end


# Recursive exponetiation
def exp1(base, n)
  return 1 if n == 0
  base * exp1(base, n-1)
end

def exp2(base, n)
  return 1 if n == 0
  if n.even?
    exp2(base, n / 2) * exp2(base, n / 2)
  else
    base * exp2(base, n / 2) * exp2(base, n / 2)
  end
end


# A method that esitimates
# how much money your child will have when they retire, based on your age.
def total_retirement_saving(your_age)
  child_age = your_age / 2
  saving_per_year = child_age * child_age
  years_to_retire = 65 - child_age
  saving_per_year * years_to_retire
end


# Recursive duplicate
class Array
  def deep_dup
    arr = []
    self.each do |el|
      el.is_a? Array ? arr << el.deep_dup : arr << el
    end
    arr
  end
end


# Fibonacci
def iterative_fib(n)
  fibs = [0, 1]
  return [] if n < 1
  return fibs[0...n] if n < 3
  until fibs.length == n
    fibs << (fibs[-2] + fibs[-1])
  end
  fibs
end

def recursive_fib(n)
  return [] if n < 1
  return [0] if n == 1
  return [0,1] if n == 2
  recursive_fib(n-1) << recursive_fib(n-1)[-2] + recursive_fib(n-1)[-1]
end

# Subsets
# subsets([1,2,3]) => [[],[1],[2],[1,2],[1,3],[2,3],[3],[1,2,3]]
def recursive_subsets(arr)
  return [[]] if arr.empty?
  last_el = arr.pop
  p sub_arr = recursive_subsets(arr)
  p last_el
  sub_arr += sub_arr.map { |el| el + [last_el] }
end

def iterative_subsets(arr)
  sub_arr = []
  0.upto(arr.length) do |size|
    sub_arr += arr.combination(size).to_a
  end
  sub_arr
end

# Permutation
def permutation(arr)
  return arr if arr.length <= 1
  mutated = []
  0.upto(arr.length-1) do |idx|
    set_aside = arr[idx]
    sub_arr = arr[0...idx] + arr[idx+1..-1]
    permutation(sub_arr).each do |el|
      if el.is_a? Array
        mutated << [set_aside] + el
      else
        mutated << [set_aside] + [el]
      end
    end
  end
  mutated
end


# Recursive binary search
def recursive_bsesarch(arr, target)
  return nil unless arr.include?(target)
  middle_index = arr.length / 2
  middle = arr[middle_index]
  if middle > target
    recursive_bsesarch(arr[0...middle_index], target)
  elsif middle == target
    return middle_index
  else
    recursive_bsesarch(arr[middle_index..-1], target)
  end
end


# Recursive merge and sort
def merge_sort(arr)
  return arr if arr.length < 2
  middle_index = arr.length / 2
  one_half = arr[0...middle_index]
  two_half = arr[middle_index..-1]
  merge(merge_sort(one_half), merge_sort(two_half))
end

# helper method for merge_sort
def merge(arr1, arr2)
  sorted = []
  until arr1.empty? || arr2.empty?
    if arr1.first > arr2.first
      sorted << arr2.shift
    else
      sorted << arr1.shift
    end
  end
  sorted += arr1 += arr2
end

def greedy_make_change(value, coins)
  coins = coins.select { |coin| coin <= value }.sort.reverse
  (1..value/coins.last).each do |size|
    combinations = (coins * value).combination(size).to_a
    combinations.each do |combi|
      if combi.reduce(:+) == value
        return combi.sort.reverse
      end
    end
  end
  nil
end
