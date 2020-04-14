require('pry')
require_relative('models/property')

Property.delete_all()

prop1 = Property.new({"address" => "1 New Street", "value" => 300000, "bedrooms" => 2, "year_built" => 1950})
prop1.save()

prop2 = Property.new({"address" => "2 New Street Plagerist", "value" => 3, "bedrooms" => 1, "year_built" => 1800})
prop2.save()

prop3 = Property.new({"address" => "3 Downing Street", "value" => 10000000, "bedrooms" => 10, "year_built" => 1300})
prop3.save()

prop4 = Property.new({"address" => "0 Nexus of Reality", "value" => -42, "bedrooms" => 0, "year_built" => 42})
prop4.save()

puts "Test all():"
p Property.all()
puts

puts "Test update():"
prop2.value = 30
prop2.update()
p Property.all()
puts

puts "Test delete():"
prop1.delete()
p Property.all()
puts

puts "Test find methods:"
p Property.find(57)
p Property.find_address("0 Nexus of Reality")
p Property.find_address("Atlantis")
puts

# binding.pry
# nil