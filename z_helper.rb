module Kernel
  def pl(*objs)
    [*objs].each do |obj|
      print obj, ' | '
    end
    
    puts "\n", '=' * 80
  end
  
  def take_time
    now = Time.now
    yield
    pl '时间:', (Time.now - now).to_f
  end
end
