# 排列组合
# [1，2，3，4，5]

# 全排列递归
def comb_recursive(arr, m, step, res)
  if step == m
    res << arr[0...m].join('-')
  else
    step.upto(arr.size - 1).each do |i|
      arr[step], arr[i] = arr[i], arr[step]
      comb_recursive(arr, m, step + 1, res)
      arr[step], arr[i] = arr[i], arr[step]
    end
  end
  
  res
end

arr = [1, 2, 3, 4, 5]
res = comb_recursive(arr, 3, 0, res = [])

res.each_with_index do |l, i|
  puts "#{i + 1}: #{l}"
end
