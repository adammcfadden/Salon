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
      name = object.fetch('name').name()
      id = object.fetch('id').id().to_i()
      stylist = Stylist.new({:name => name, :id => id})
      stylist_array.push(stylist)
    end
    stylist_array
  end
end
