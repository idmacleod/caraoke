require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../sushi')

class SushiTest < MiniTest::Test

    def setup()
        @sushi = Sushi.new("California Roll", :maki, 4.50, false)
    end

    def test_sushi_has_name()
        assert_equal("California Roll", @sushi.name)
    end

    def test_sushi_has_type()
        assert_equal(:maki, @sushi.type)
    end

    def test_sushi_has_price()
        assert_equal(4.50, @sushi.price)
    end

    def test_sushi_is_vegetarian()
        assert_equal(false, @sushi.is_vegetarian)
    end

end