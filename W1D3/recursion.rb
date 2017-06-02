# homework for W1D3

def sum_to(num)
  return nil if num < 1
  num == 1 ? 1 : num + sum_to(num-1)
end

def add_numbers(arr)
  return nil if arr.length == 0
  arr.length == 1 ? arr[0] : arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(num)
  return nil if num == 0
  num == 1 ? 1 : (num-1) * gamma_fnc(num-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.length == 0
  flavors.pop == favorite ? true : ice_cream_shop(flavors, favorite)
end

def reverse(str)
  return str if str.length <= 1
  str[-1] << reverse(str[0...-1])
end
