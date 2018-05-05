# 请输入数字：
# 999
# 执行1次，index：499，left：0，right：999
# 执行2次，index：749，left：500，right：999
# 执行3次，index：874，left：750，right：999
# 执行4次，index：937，left：875，right：999
# 执行5次，index：968，left：938，right：999
# 执行6次，index：984，left：969，right：999
# 执行7次，index：992，left：985，right：999
# 执行8次，index：996，left：993，right：999
# 执行9次，index：998，left：997，right：999
# 执行10次，index：999，left：999，right：999
# 查找999的位置：999

def binary_search(num, arr)
  i     = 0
  left  = 0
  right = arr.size - 1
  
  loop do
    return if left > right
    
    index = (left + right) / 2
    puts "执行#{i += 1}次，index：#{index}，left：#{left}，right：#{right}"
    
    if num == arr[index]
      return index
    elsif num > arr[index]
      left = index + 1
    elsif num < arr[index]
      right = index - 1
    end
  end
end

arr = (0..999).to_a
num = nil

k = 3
k.times do |i|
  puts '请输入数字：'
  num = STDIN.gets
  if num.match(/\d+/)
    num = num.to_i
    break
  else
    num = nil
    puts '没有机会啦！！！' if i >= k - 1
  end
end

if num
  index = binary_search(num.to_i, arr)
  puts "查找#{num}的位置：#{index || '没找到'}"
end
