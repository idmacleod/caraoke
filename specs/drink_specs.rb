require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../drink')

class DrinkTest < MiniTest::Test

    def setup()
        @drink = Drink.new("Sawanotsuru", :sake, 5.00, 20)
    end

    def test_drink_has_name()
        assert_equal("Sawanotsuru", @drink.name)
    end

    def test_drink_has_type()
        assert_equal(:sake, @drink.type)
    end

    def test_drink_has_price()
        assert_equal(5.00, @drink.price)
    end

    def test_drink_has_alcohol()
        assert_equal(20, @drink.alcohol)
    end

end