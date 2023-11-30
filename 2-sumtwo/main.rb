# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    n1 = []
    tmp = l1
    n1 << tmp.val
    while tmp.next
        tmp = tmp.next
        n1 << tmp.val
    end
    
    n2 = []
    tmp = l2
    n2 << tmp.val
    while tmp.next
        tmp = tmp.next
        n2 << tmp.val
    end
    
    nn1 = n1.reverse.join.to_i
    nn2 = n2.reverse.join.to_i
    return (nn1 + nn2).to_s.chars.reverse.map(&:to_i)
end
