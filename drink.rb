class Drink

    attr_reader :name, :type, :price, :alcohol

    def initialize(name, type, price, alcohol)
        @name = name
        @type = type
        @price = price
        @alcohol = alcohol
    end

end