require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class RoomTest < MiniTest::Test

    def setup()
        @room = Room.new("Little Blue Room", 4, 5.00)
        @room2 = Room.new("Tiny Green Room", 2, 2.00)
        @song = Song.new("My Way", "Frank Sinatra")
        @song2 = Song.new("Song 2", "Blur")
        @guest = Guest.new("Scarlett", 35, 1000000.00, @song, false)
        @guest2 = Guest.new("Poor Joe", 81, 2.50, @song2, true)
    end

    def test_room_has_name()
        assert_equal("Little Blue Room", @room.name)
    end

    def test_room_has_capacity()
        assert_equal(4, @room.capacity)
    end

    def test_room_has_entry_fee()
        assert_equal(5.00, @room.entry_fee)
    end

    def test_room_starts_empty()
        assert_equal(0, @room.guests.length)
    end

    def test_room_playlist_starts_empty()
        assert_equal(0, @room.playlist.length)
    end

    def test_room_starts_with_no_takings()
        assert_equal(0.00, @room.takings)
    end

    def test_check_in()
        @room.check_in(@guest)
        assert_equal(1, @room.guests.length)
        assert_equal(5.00, @room.takings)
    end

    def test_check_out()
        @room.check_in(@guest)
        @room.check_out(@guest)
        assert_equal(0, @room.guests.length)
    end

    def test_guest_cannot_check_in_to_room_they_are_in()
        @room.check_in(@guest)
        @room.check_in(@guest)
        @room.check_in(@guest)
        assert_equal(1, @room.guests.length)
        assert_equal(5.00, @room.takings)
    end

    def test_guest_cannot_check_out_of_room_they_are_not_in()
        @room.check_out(@guest)
        assert_equal(0, @room.guests.length)
    end

    def test_room_is_full__true
        @room2.check_in(@guest)
        @room2.check_in(@guest2)
        assert(@room2.is_full?())
    end

    def test_room_is_full__false
        @room.check_in(@guest)
        @room.check_in(@guest2)
        refute(@room.is_full?())
    end

    def test_cannot_check_in_guest_if_room_full()
        song3 = Song.new("Dancing Queen", "ABBA")
        guest3 = Guest.new("Brad", 56, 1000000.00, song3, true)
        @room2.check_in(@guest)
        @room2.check_in(@guest2)
        @room2.check_in(guest3)
        assert_equal(2, @room2.guests.length)
        assert_equal(4.00, @room2.takings)
    end
    
    def test_guest_cannot_check_in_without_sufficient_funds()
        @room.check_in(@guest)
        @room.check_in(@guest2)
        assert_equal(1, @room.guests.length)
        assert_equal(5.00, @room.takings)
    end

    def test_add_song()
        @room.add_song(@song)
        assert_equal(1, @room.playlist.length)
        assert_equal(Song, @room.playlist[0].class)
    end

    def test_remove_song()
        @room.add_song(@song)
        @room.add_song(@song2)
        @room.remove_song(@song)
        assert_equal(1, @room.playlist.length)
    end

end




