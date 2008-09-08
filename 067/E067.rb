require 'euler_solution.rb'
class E067 < EulerSolution



  def zn(n)
    n.nil? ? 0 : n.to_i
  end

  def answer  
    f = File.new(File.dirname(__FILE__)+'/triangle.txt')    
    foo = f.read.split(/$/)
    tri = foo.inject(Array.new) { |arr, row| arr << row.split }           
    #tri.each {|r| puts r.join(', ') }   
    dist = Array.new
    (0...tri.size).each do |rn|
      dist[rn]=Array.new
      (0...tri[rn].size).each do |en|
        cur = zn(tri[rn][en])
        dist[rn][en] =  cur + [zn(dist[rn-1][en]), zn(dist[rn-1][en-1])].max 
      end
    end
    #dist.each {|r| puts r.join(', ') }   
    dist[dist.size-1].max    
  end

end