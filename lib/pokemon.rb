class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize (id:nil, name:, type:, db:nil)
      @id = id
      @name = name
      @type = type
      @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type) VALUES (?, ?);
        SQL
        
        db.execute(sql, [name, type])
    end

    def self.find(id, db)
        search = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    
        Pokemon.new(id: search[0], name: search[1], type: search[2], db:db)
    end
end
