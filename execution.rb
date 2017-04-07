require 'benchmark'

def my_min_worse(array)
  # O(n^2 - n) ~ O(n^2), nested loops
  res = nil

  array.each.with_index do |el, idx|
    # n steps, step 2

    break if idx + 1 == array.length
    array.drop(idx + 1).each do |el2|
      # n - 2
      if el < el2
        res = el
      else
        res = el2
      end
    end
  end

  res
end

def my_min(array)
  # O(n)
  r = array.first
  array.drop(1).each do |el|
    r = el if el < r
  end

  r
end

def sub_sum_worse(array)
  sub_array = []

  (0...array.length).each do |i|
    (i...array.length).each do |j|
      sub_array << array[i..j]
    end
  end

  sub_array.map { |sub_a| sub_a.reduce(:+) }.max
end

def sub_sum(array)
  largest_sum = array.first
  running_sum = array.first

  array.drop(1).each do |el|
    if running_sum + el < el
      running_sum = el
    else
      running_sum += el
    end

    largest_sum = running_sum if running_sum > largest_sum
  end

  largest_sum
end


a = (-100..100).to_a.shuffle
a2 = (-1000..1000).to_a.shuffle
a3 = (-10000..10000).to_a.shuffle
puts "---best----"
puts Benchmark.measure { sub_sum(a)}
puts Benchmark.measure { sub_sum(a2)}
puts Benchmark.measure { sub_sum(a3)}
puts "---worse----"
puts Benchmark.measure { sub_sum_worse(a)}
puts Benchmark.measure { sub_sum_worse(a2)}
puts Benchmark.measure { sub_sum_worse(a3)}
