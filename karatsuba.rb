def multiplier(int1, int2)
  ## base case 
  if int1.to_s.length == 1 || int2.to_s.length == 1
    return int1 * int2
  end
  size = [int1.to_s.length,int2.to_s.length].max
  m = ((size + 1) / 2)
  n = size/2
  splits1 = split_int(int1, m, size)
  splits2 = split_int(int2, m, size)
  a = splits1.first
  b = splits1.last
  c = splits2.first 
  d = splits2.last 
  ac = multiplier(a,c)
  bd = multiplier(b,d)
  abcd = multiplier((a + b),(c + d))
  cheat = abcd - ac - bd
  return karatsuba(ac, bd, cheat, n)
end

def split_int(int, split, size)
  zeroes = size - int.to_s.length
  int_arr = int.to_s.split('').map(&:to_i)
  zeroes.times do
    int_arr.unshift(0)
  end
  arr1,arr2 = int_arr.each_slice(split).to_a
  return arr1.join.to_i, arr2.join.to_i
end

def karatsuba(ac, bd, cheat, n)
  return 10**(2*n)*ac + (10**n)*cheat + bd 
end

multiplier(1234,5678)