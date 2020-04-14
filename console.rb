require('pry')
require_relative('models/property')

Property.delete_all()

prop1 = Property.new({"address" => "1 New Street", "value" => 300000, "bedrooms" => 2, "year_built" => 1950})
prop1.save()

binding.pry
nil