require 'euler_solution.rb'
class E019 < EulerSolution
  
  MONTHLEN = {
    1 => 31,
    2 => 28,
    3 => 31,
    4 => 30,
    5 => 31,
    6 => 30,
    7 => 31,
    8 => 31,
    9 => 30,
    10 => 31,
    11 => 30,
    12 => 31
  }
  
  DAYS = [ 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
  
  def add_day
    # increment day of week
    @dow =  (@dow + 1) % 7
    
    @dom += 1
    if (@dom > MONTHLEN[@mo])
      # special case for leap days
      return if ((@mo == 2) and (@dom == 29) and (@year % 4).zero? and !(@year % 100).zero?)
      @dom = 1
      @mo += 1
      if @mo > 12
        @mo = 1
        @year += 1
      end
    end
  end
  
  def answer
    @dow = 1      # sunday is 0
    @year = 1900
    @mo = 1       # january is 1
    @dom = 1      # 1st of the mont
    count = 0
    until (@year == 2000) and (@dom == 31) and (@mo == 12) do 
      add_day
      # puts "--" if @dom == 1 
      #       puts "#{DAYS[@dow]}: #{@dom} #{@mo} #{@year}"
      count += 1 if @dow == 0 and @dom == 1 and @year >= 1901
    end
    count
  end
  
end