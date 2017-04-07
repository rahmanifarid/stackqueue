def first_anagram(str1, str2)
  # O(n*n!)
  anagram_arrays = str1.split("").permutation # O(n!)
  all_anagrams = anagram_arrays.map(&:join) # n! steps * O(n) (?) ~ O(n*n!)
  all_anagrams.include?(str2) # iterate through n! elements * O(n)
end

def second_anagram(str1, str2)
  # O(n^2)
  return false unless str1.length == str2.length
  array1 = str1.split("")
  array2 = str2.split("")
  i = 0
  while i < array1.length
    found_idx = array2.find_index(array1[i])
    return false unless found_idx
    array1.delete_at(i)
    array2.delete_at(found_idx)
  end

  array1.empty? && array2.empty?
end

def third_anagram(str1, str2)
  # O(nlogn)
  array1 = str1.split("")
  array2 = str2.split("")

  array1.sort! #O(nlogn) [assuming good sort]
  array2.sort!

  array1 == array2 #O(n)
end

def fourth_anagram(str1, str2)
  # O(n)
  hash1, hash2 = Hash.new(0), Hash.new(0)

  str1.split("").each { |el| hash1[el] += 1 } #O(n)
  str2.split("").each { |el| hash2[el] += 1 }

  hash1 == hash2 # O(n)
end
