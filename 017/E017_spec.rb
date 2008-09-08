require File.dirname(__FILE__) + "/../spec/spec_helper.rb"
require File.dirname(__FILE__) + "/E017"

describe "E017" do
  before(:each) do
    @es = E017.new
  end
  
  describe "tens_string" do
    it "should generate single numbers" do
      @es.tens_string(0).should == ""  
      @es.tens_string(1).should == "one"
      @es.tens_string(2).should == "two"
      @es.tens_string(3).should == "three"
      @es.tens_string(4).should == "four"
      @es.tens_string(5).should == "five"
      @es.tens_string(6).should == "six"
      @es.tens_string(8).should == "eight"
      @es.tens_string(7).should == "seven"
      @es.tens_string(9).should == "nine"      
    end
    
    it "should handle teens" do
      @es.tens_string(10).should == "ten"
      @es.tens_string(11).should == "eleven"
      @es.tens_string(12).should == "twelve"
      @es.tens_string(13).should == "thirteen"
      @es.tens_string(14).should == "fourteen"
      @es.tens_string(15).should == "fifteen"
      @es.tens_string(16).should == "sixteen"
      @es.tens_string(17).should == "seventeen"
      @es.tens_string(18).should == "eighteen"
      @es.tens_string(19).should == "nineteen"      
    end
    
    it "should handle double digit numbers" do
      @es.tens_string(29).should == "twenty-nine"
      @es.tens_string(38).should == "thirty-eight"
      @es.tens_string(47).should == "forty-seven"
      @es.tens_string(56).should == "fifty-six"
      @es.tens_string(65).should == "sixty-five"
      @es.tens_string(74).should == "seventy-four"
      @es.tens_string(83).should == "eighty-three"
      @es.tens_string(91).should == "ninety-one"
      @es.tens_string(61).should == "sixty-one"      
    end
  end
  
  describe "english" do
    it "should generate single numbers" do
      @es.english(1).should == "one"
      @es.english(2).should == "two"
      @es.english(3).should == "three"      
    end
    
    it "should generate isolated hundreds" do
      @es.english(100).should == "one hundred"
      @es.english(400).should == "four hundred"
      @es.english(500).should == "five hundred"
      @es.english(800).should == "eight hundred"
    end
    
    it "should generate combination" do
      @es.english(117).should == "one hundred and seventeen"
      @es.english(245).should == "two hundred and forty-five"
      @es.english(870).should == "eight hundred and seventy"      
    end
    
    it "should make 1000" do
      @es.english(1000).should == 'one thousand'
    end
  end
  
  describe "connect" do
    it "should connect two strings if both exist" do
      @es.connect('foo', 'bar', ' and ').should == 'foo and bar'
      @es.connect('thirty', 'five', '-').should == 'thirty-five'      
    end
    
    it "should ignore connector if first is blank" do
      @es.connect('', 'bar', ' and ').should == 'bar'
    end
    
    it "should ignore connector if second is blank" do
      @es.connect('foo', nil, ' and ').should == 'foo'
    end    
  end
  
  describe "letters" do
    it "should count letters correctly" do
      @es.letters(342).should == 23
      @es.letters(115).should == 20      
    end
  end  
  
end
