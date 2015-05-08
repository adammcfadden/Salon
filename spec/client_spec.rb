require 'spec_helper'

describe(Client) do
  describe('#name') do
    it('will return the name of a client') do
      test_client = Client.new({:name => 'archer', :id => nil})
      expect(test_client.name()).to(eq('archer'))
    end
  end

  describe(".all") do
    it('will return an array of all clients objects in the database') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#id") do
    it('will return the id of a client') do
      test_client = Client.new({:name => 'pam', :id => nil})
      test_client.save()
      expect(test_client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it('will save a client to the database') do
      test_client = Client.new({:name => 'carol', :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#==') do
    it('makes the == operator true if names are the same') do
      test_client1 = Client.new({:name => 'malory', :id => nil})
      test_client2 = Client.new({:name => 'malory', :id => nil})
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe(".find") do
    it('will return a client object associated with the given id') do
      test_client1 = Client.new({:name => 'ray', :id => nil})
      test_client1.save()
      test_client2 = Client.new({:name => 'cyril', :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe("#delete") do
    it('will delete a client object from the database') do
      test_client1 = Client.new({:name => 'kreiger', :id => nil})
      test_client1.save()
      test_client1.delete()
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#update") do
    it('will allow you to update a client object in the database') do
      test_client1 = Client.new(:name => 'brent', :id => nil)
      test_client1.save()
      test_client1.update({:name => 'barry'})
      expect(test_client1.name()).to(eq('barry'))
    end
  end
end
