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

  start_idx      = 0
  longest_found  = 0
  curr           = {}
  found          = false
  last_iteration = false

  while !found
    chars.each_with_index do |c, idx|
      next if idx < start_idx

      if curr[c]
        longest_found = curr.values.sum if curr.values.sum > longest_found
        start_idx     = s[start_idx...].chars.find_index(c) + start_idx + 1
        curr          = {}
        found         = (s.length - (start_idx + 1) < longest_found)
        break
      end

      curr[c] = 1
    end
  end

  return longest_found
end
