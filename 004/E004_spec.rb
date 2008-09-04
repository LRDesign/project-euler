require 'E004'

describe 'E004' do
  before :each do
    @solution = E004.new
  end
  
  it "should compute 6-digit palindromes" do
    @solution.palindrome(556).should == 556655    
    @solution.palindrome(704).should == 704407
    @solution.palindrome(436).should == 436634
    @solution.palindrome(125).should == 125521    
  end  
  
  describe "three_digit" do
    it "should find 3-digit numbers" do
      @solution.three_digits?(100).should == true
      @solution.three_digits?(101).should == true
      @solution.three_digits?(567).should == true
      @solution.three_digits?(999).should == true
    end
    
    it "should reject smaller numbers" do
      @solution.three_digits?(99).should == false
      @solution.three_digits?(90).should == false
      @solution.three_digits?(10).should == false
      @solution.three_digits?(-5).should == false      
    end
    
    it "should reject larger numbers" do
      @solution.three_digits?(9999).should == false
      @solution.three_digits?(1000).should == false
      
    end
  end
end
