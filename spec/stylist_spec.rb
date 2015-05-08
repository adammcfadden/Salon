require 'spec_helper'

describe (Stylist) do
  describe("#name") do
    it('will return the name of a stylist') do
      test_stylist = Stylist.new({:name => 'scruffy', :id => nil})
      expect(test_stylist.name()).to(eq('scruffy'))
    end
  end

  describe(".all") do
    it('will return an array of all stylists objects in the database') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#id") do
    it('will return the id of a stylist') do
      test_stylist = Stylist.new({:name => 'bender', :id => nil})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it('will save a stylist to the database') do
      test_stylist = Stylist.new({:name => 'leela', :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it('makes the == operator true if names are the same') do
      test_stylist1 = Stylist.new({:name => 'amy', :id => nil})
      test_stylist2 = Stylist.new({:name => 'amy', :id => nil})
      expect(test_stylist1).to(eq(test_stylist2))
    end
  end

  describe(".find") do
    it('will return a stylist object associated with the given id') do
      test_stylist1 = Stylist.new({:name => 'fry', :id => nil})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:name => 'hubert', :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

#
#   describe("#delete") do
#
#   end
#
#   describe("#update") do
#
#   end
end
