# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    end_idx = nums.length
    mx      = nums.max
    mn      = nums.min
    nums.each_with_index do |num, idx|
        diff = target - num
        next if diff > mx
        next if diff < mn
        minified_arr = nums.slice(idx+1, end_idx)
        next unless minified_arr.include?(diff)
        
        return [idx, minified_arr.find_index(diff) + idx + 1]
    end
end
