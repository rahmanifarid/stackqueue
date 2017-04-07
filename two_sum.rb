def bad_two_sum(arr, target)
  # get all pairs

end

def okay_two_sum(arr, target)
  # sort array
  # select els < target
  # iterate through these, bsearch for target - el

  arr.sort! # O(nlogn)
  arr.each_with_index do |el, idx| #O(n)
    other_els = arr[idx + 1..-1]
    return true if binary_search(other_els, target - el) #O(logn)
  end

  false
end


def binary_search(arr, target)
  return nil if arr.empty?

  middle = arr.length / 2
  case arr[middle] <=> target
  when 1
    binary_search(arr[0...middle], target)
  when 0
    middle
  when -1
    search_res = binary_search(arr[middle + 1..-1], target)
    search_res ? search_res + middle + 1 : nil
  end
end

def good_two_sum(arr, target)
  hash = Hash.new(0)

  arr.each{|el| hash[el] += 1} # O(n)

  hash.keys.each do |key|
    if target == 2 * key
      return true if hash[key] > 1
    else
      return true if hash[target - key] > 0
    end
  end
  false

end
