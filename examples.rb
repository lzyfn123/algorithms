# '2 1 34 43 56 77 23 81 333 123 231 024'
# 1、先按数字的长度排序
# 2、再按数子每位之和排序
# 3、最后按数字的首位排序
# 结果：'1 2 23 34 43 81 56 77 023 123 231 333'

def sort_str_nums(str_nums)
  # 数字的长度排序、分组
  barrel = str_nums.sort_by(&:length).group_by(&:length)
  
  barrel.each do |k, v|
    # 按数子每位之和排序
    v.sort_by! { |a| a.chars.map(&:to_i).inject(:+) }
    vv = v.group_by { |a| a.chars.map(&:to_i).inject(:+) }
    
    # 按数字的首位排序
    vv.each do |_, vvv|
      vvv.sort!
    end
    barrel[k] = vv.values.flatten
  end
  
  barrel.values.flatten
end

def handle_format(str)
  str_nums = str.split(' ')
  sort_str_nums(str_nums).join(' ')
end

str = '231 2 77 1 34 43 56 23 81 333 123 023'
p handle_format(str)
