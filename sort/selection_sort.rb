# 选择排序（Selection Sort）
# [86, 97, 65, 16, 43, 44, 56, 71, 91, 70, 16]
# [16, 97, 65, 86, 43, 44, 56, 71, 91, 70, 16]
# [16, 16, 65, 86, 43, 44, 56, 71, 91, 70, 97]
# [16, 16, 43, 86, 65, 44, 56, 71, 91, 70, 97]
# [16, 16, 43, 44, 65, 86, 56, 71, 91, 70, 97]
# [16, 16, 43, 44, 56, 86, 65, 71, 91, 70, 97]
# [16, 16, 43, 44, 56, 65, 86, 71, 91, 70, 97]
# [16, 16, 43, 44, 56, 65, 70, 71, 91, 86, 97]
# [16, 16, 43, 44, 56, 65, 70, 71, 91, 86, 97]
# [16, 16, 43, 44, 56, 65, 70, 71, 86, 91, 97]
# [16, 16, 43, 44, 56, 65, 70, 71, 86, 91, 97]

def selection_sort(arr)
  step = arr.size - 1
  
  0.upto(step).each do |i|
    min_index = i
    (i + 1).upto(step).each do |j|
      if arr[min_index] > arr[j]
        min_index = j
      end
    end
    arr[i], arr[min_index] = arr[min_index], arr[i]
  end
  
  arr
end

arr = [86, 97, 65, 16, 43, 44, 56, 71, 91, 70, 16]
p selection_sort(arr)
