require 'spec_helper'

describe (Stylist) do
  describe("#name") do
    it('will return the name of a stylist') do
      test_stylist = Stylist.new({:name => 'suzzie', :id => nil})
      expect(test_client.name()).to(eq('sally'))
    end
  end

#   describe("#id") do
#
#   end
#
#   describe(".all") do
#
#   end
#
#   describe("#save") do
#
#   end
#
#   describe(".find") do
#
#   end
#
#   describe("#delete") do
#
#   end
#
#   describe("#update") do
#
#   end
end
