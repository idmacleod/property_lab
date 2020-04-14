require('pry')
require_relative('models/property')

Property.delete_all()

prop1 = Property.new({"address" => "34 Whitby Avenue", "value" => 300000, "bedrooms" => 2, "year_built" => 1950})
prop1.save()

prop2 = Property.new({"address" => "2 Walrus Terrace", "value" => 250000, "bedrooms" => 1, "year_built" => 1800})
prop2.save()

prop3 = Property.new({"address" => "18 Llama Road", "value" => 10000000, "bedrooms" => 10, "year_built" => 1300})
prop3.save()

prop4 = Property.new({"address" => "0 Nexus of Reality", "value" => -42, "bedrooms" => 0, "year_built" => 42})
prop4.save()

puts "C -- 4 lines added to database!"
puts "R -- Use all() method to read the table:"
p Property.all()
puts

puts "U -- Update value of 2 Walrus Terrace to 500000:"
prop2.value = 500000
prop2.update()
p Property.all()
puts

puts "D -- Delete 34 Whitby Avenue:"
prop1.delete()
p Property.all()
puts

puts "Testing find methods:"
p Property.find(57)
p Property.find_address("0 Nexus of Reality")
p Property.find_address("Atlantis")
puts

# binding.pry
# nil