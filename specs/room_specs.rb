require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../room')

class RoomTest < MiniTest::Test

    def setup()
        @room = Room.new("Little Blue Room", 4, 5.00)
    end

    def test_room_has_name
        assert_equal("Little Blue Room", @room.name)
    end

    def test_room_has_capacity
        assert_equal(4, @room.capacity)
    end

    def test_room_has_entry_fee
        assert_equal(5.00, @room.entry_fee)
    end

    def test_room_starts_empty
        assert_equal(0, @room.guests.length)
    end

    def test_room_playlist_starts_empty
        assert_equal(0, @room.playlist.length)
    end

    def test_room_starts_with_no_takings
        assert_equal(0.00, @room.takings)
    end

end




