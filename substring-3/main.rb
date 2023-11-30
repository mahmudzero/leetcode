# Longest substring without any repeating characters
# So we have something like the following
# foobarbazbizwhaterloo
#
# The answer here would be `whaterlo`, as it is the longest string of characters that has only unique characters

def length_of_longest_substring(s)
  chars = s.chars
  return chars.uniq.length if chars.uniq.length <= 1

  if s.split("\x20").uniq.length < s.split("\x20").length
    return s.split("\x20").uniq.map { |ss| length_of_longest_substring(ss) }.max + 1
  end

  longest_found  = 0
  curr           = {}
  found          = false

  while !found
    chars.each_with_index do |c, idx|
      if curr[c]
        longest_found = curr.values.sum if curr.values.sum > longest_found
        start_idx     = chars.find_index(c) + 1
        chars         = chars[start_idx...]
        curr          = {}
        found         = chars.length < longest_found
        break
      end

      curr[c] = 1
    end
  end

  return longest_found
end
