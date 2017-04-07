def windowed_max_range(arr, w)
  current_max_range = 0

  arr.each_index do |i|
    next if w + i == arr.length - 1
    window = arr[i...w + i]
    min = window.min
    max = window.max
    if current_max_range < (max -  min)
      current_max_range = max - min
    end
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
