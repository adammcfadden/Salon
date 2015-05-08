require 'spec_helper'

describe(Client) do
  describe('#name') do
    it('will return the name of a client') do
      test_client = Client.new({:name => 'hermes', :id => nil})
      expect(test_client.name()).to(eq('hermes'))
    end
  end
  # describe('#id') do
  #
  # end
  #
  # describe('.all') do
  #
  # end
  #
  # describe('#save') do
  #
  # end
  #
  # describe('.find') do
  #
  # end
  #
  # describe('#delete') do
  #
  # end
  #
  # describe('#update') do
  #
  # end
end
