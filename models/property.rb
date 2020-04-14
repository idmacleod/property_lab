require('pg')

class Property

    attr_accessor :address, :value, :bedrooms, :year_built
    attr_reader :id

    def initialize(options)
        @address = options["address"]
        @value = options["value"].to_i
        @bedrooms = options["bedrooms"].to_i
        @year_built = options["year_built"].to_i
        @id = options["id"].to_i if options["id"]
    end

    def save()
        db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
        sql = "INSERT INTO properties (address, value, bedrooms, year_built) VALUES ($1, $2, $3, $4) RETURNING id;"
        values = [@address, @value, @bedrooms, @year_built]
        db.prepare("save", sql)
        @id = db.exec_prepared("save", values)[0]["id"].to_i
        db.close()
    end

    def self.all()
        db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
        sql = "SELECT * FROM properties;"
        db.prepare("all", sql)
        properties = db.exec_prepared("all")
        db.close()
        return properties.map {|property_hash| self.new(property_hash)}
    end

    def update()
        db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
        sql = "UPDATE properties SET (address, value, bedrooms, year_built) = ($1, $2, $3, $4) WHERE id = $5;"
        values = [@address, @value, @bedrooms, @year_built, @id]
        db.prepare("update", sql)
        db.exec_prepared("update", values)
        db.close()
    end

    def self.delete_all()
        db = PG.connect ({dbname: 'property_tracker', host: 'localhost'})
        sql = "DELETE FROM properties;"
        db.prepare("delete_all", sql)
        db.exec_prepared("delete_all")
        db.close()
    end

    def delete()
        db = PG.connect ({dbname: 'property_tracker', host: 'localhost'})
        sql = "DELETE FROM properties WHERE id = $1;"
        values = [@id]
        db.prepare("delete", sql)
        db.exec_prepared("delete", values)
        db.close()
    end

end