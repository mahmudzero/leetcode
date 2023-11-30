# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

def find_median_sorted_arrays(nums_1, nums_2)
    h = Hash.new(0)
    
    nums_1.each { |i| h[i] += 1 }
    nums_2.each { |i| h[i] += 1 }
    
    a = []
    
    h.keys.sort.each { |k| a.concat(Array.new(h[k], k)) }
    
    l = a.length
    if (l % 2).zero?
        li = (l / 2) - 1
        hi = li + 1
        return (a[li] + a[hi]).to_f / 2.0
    end
    
    return a[l/2]
end
