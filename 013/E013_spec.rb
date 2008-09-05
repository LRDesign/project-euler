require File.dirname(__FILE__) + "/../spec/spec_helper.rb"
require File.dirname(__FILE__) + "/E013"

describe "E013" do
  before(:each) do
    @es = E013.new
  end
  
  describe "number_array" do
    it "should have 100 members" do
      @es.number_array.should have(100).members
    end
  end
end