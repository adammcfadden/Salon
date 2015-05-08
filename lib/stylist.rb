class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    stylist_table = DB.exec("SELECT * FROM stylists;")
    stylist_array = []
    stylist_table.each() do |object|
      name = object.fetch('name')
      id = object.fetch('id').to_i()
      stylist = Stylist.new({:name => name, :id => id})
      stylist_array.push(stylist)
    end
    stylist_array
  end

  define_method(:save) do
    returns = DB.exec("INSERT INTO stylists (name) VALUES ('#{self.name()}') RETURNING id")
    @id = returns.first().fetch('id').to_i
  end

  define_method(:==) do |other|
    self.name() == other.name()
  end

  define_singleton_method(:find) do |identification|
    stylist = DB.exec("SELECT * FROM stylists WHERE id = #{identification}")
    name = stylist.first().fetch('name')
    Stylist.new({:name => name, :id => identification})
  end
end
