require 'spec_helper'

describe "Response" do
  include Checkoutfi::SpecHelper

  it 'can be instantiated' do
    doing { Checkoutfi::Response.new }.should_not raise_error
  end

  before do
    @response = Checkoutfi::Response.new
  end

  describe "valid options" do
    it 'can be set' do
      @response.stamp = "foo"
      @response.stamp.should == "foo"
    end

    it 'can be set via the constructor' do
      Checkoutfi::Response.new(:stamp => 'foo').stamp.should == 'foo'
      Checkoutfi::Response.new('STAMP' => 'foo').stamp.should == 'foo'
    end
  end

  describe "invalid options" do
    it 'ignores invalid options in the constructor opts' do
      doing { Checkoutfi::Response.new('FOO' => 'bar') }.should_not raise_error
    end
  end

  it 'calculates a mac from the given params' do
    @response = response_with_all_attributes_set
    @response.calculated_mac.should == '594C1AF45840F4E58AB4BE9E562D2636'
  end

  describe "#valid?" do
    it 'returns true if the calculated and specified mac are the same' do
      @response = response_with_all_attributes_set
      @response.should be_valid
    end

    it 'returns false if the calculated mac and the specified mac are not the same' do
      @response = response_with_all_attributes_set
      @response.stamp = '0000000'
      @response.should_not be_valid
    end
  end

  describe "#acceptable?" do
    # see the API docs for further info

    it 'returns true if the status specifies an accepted payment' do
      @response = response_with_all_attributes_set
      [2,4,5,6,7,8,9,10].each do |status|
        @response.status = status
        @response.should be_acceptable
      end
    end

    it 'returns true if the status does not specify an accepted payment' do
      @response = response_with_all_attributes_set
      @response.status = -1
      @response.should_not be_acceptable
    end
  end
end
