require File.dirname(__FILE__) + "/../spec/spec_helper.rb"
require File.dirname(__FILE__) + "/E015"

describe "E015" do
  before(:each) do
    @es = E015.new
  end
  
  describe "pascal_row" do
    it "should generate row 2" do
      @es.pascal_row([1]).should eql[1, 1]
    end
    it "should generate row 4" do
      @es.pascal_row([1, 2, 1]).should eql[1, 3, 3, 1]
    end
    
  end
  
end
