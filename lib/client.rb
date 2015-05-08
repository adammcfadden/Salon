class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    client_table = DB.exec("SELECT * FROM clients;")
    client_array = []
    client_table.each() do |object|
      name = object.fetch('name')
      id = object.fetch('id').to_i()
      client = Client.new({:name => name, :id => id})
      client_array.push(client)
    end
    client_array
  end

  define_method(:save) do
    returns = DB.exec("INSERT INTO clients (name) VALUES ('#{self.name()}') RETURNING id;")
    @id = returns.first().fetch('id').to_i
  end

  define_method(:==) do |other|
    self.name() == other.name()
  end

  define_singleton_method(:find) do |identification|
    client = DB.exec("SELECT * FROM clients WHERE id = #{identification};")
    name = client.first().fetch('name')
    Client.new({:name => name, :id => identification})
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id}")
  end

  define_method(:stylist) do
    client_data = DB.exec("SELECT * FROM clients WHERE id = #{self.id()};")
    stylist_id = client_data.first().fetch("stylist_id")
    Stylist.find(stylist_id)
  end
end
