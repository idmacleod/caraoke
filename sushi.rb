class Sushi

    attr_reader :name, :type, :price, :is_vegetarian

    def initialize(name, type, price, is_vegetarian)
        @name = name
        @type = type
        @price = price
        @is_vegetarian = is_vegetarian
    end

end