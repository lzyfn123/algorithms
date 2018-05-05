# 归并排序（Merge Sort）
# left: [97], right: [65]
# left: [86], right: [65, 97]
# left: [43], right: [44]
# left: [16], right: [43, 44]
# left: [65, 86, 97], right: [16, 43, 44]
# left: [16], right: [56]
# left: [16], right: [16, 56]
# left: [71], right: [91]
# left: [70], right: [16]
# left: [71, 91], right: [16, 70]
# left: [16, 16, 56], right: [16, 70, 71, 91]
# left: [16, 43, 44, 65, 86, 97], right: [16, 16, 16, 56, 70, 71, 91]

def merge_arr(left, right)
  # puts "left: #{left}, right: #{right}"
  left  ||= []
  right ||= []
  res   = []
  
  loop do
    res += right and break if left.empty?
    res += left and break if right.empty?
    
    if left.first <= right.first
      res << left.shift
    else
      res << right.shift
    end
  end
  
  res
end

def merge_sort(arr)
  len = arr.size
  return arr if len < 2
  
  mid   = len / 2
  left  = merge_sort(arr[0, mid])
  right = merge_sort(arr[mid, len - mid])
  
  merge_arr(left, right)
end

def merge_sort_loop(arr)
  len = arr.size
  return arr if len < 2
  
  step = 1
  loop do
    res = []
    
    0.step(len, step * 2).each do |i|
      res += merge_arr(arr[i, step], arr[i+step, step])
    end
    arr  = res
    step <<= 1
    
    break if step >= len
  end
  
  arr
end

arr = [86, 97, 65, 16, 43, 44, 16, 16, 56, 71, 91, 70, 16]
# p merge_sort(arr)
p merge_sort_loop(arr)
