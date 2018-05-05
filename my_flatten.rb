# 扁平化Hash
# [1, 2, 3, [11, 33, 55, 22, [[4444, 2222], 222], 666]]

def my_flatten(arr, level = -1)
  arr = arr.dup
  
  loop do
    break if level.zero?
    level -= 1
    
    res  = []
    flag = true
    
    arr.each do |val|
      if val.is_a?(Array)
        res  += val
        flag = flag && val.all? { |sub_val| !sub_val.is_a?(Array) }
      else
        res << val
      end
    end
    
    arr = res
    break if flag
  end
  
  arr
end

arr = [1, 2, 3, [11, 33, 55, 22, [[4444, 2222], 222], 666]]

# [1, 2, 3, 11, 33, 55, 22, [[4444, 2222], 222], 666]
puts my_flatten(arr, 1).inspect

# [1, 2, 3, 11, 33, 55, 22, 4444, 2222, 222, 666]
puts my_flatten(arr, -1).inspect

