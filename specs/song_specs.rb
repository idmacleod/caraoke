require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../song')

class SongTest < MiniTest::Test

    def setup()
        @song = Song.new("My Way", "Frank Sinatra")
    end

    def test_song_has_title()
        assert_equal("My Way", @song.title)
    end

    def test_song_has_artist()
        assert_equal("Frank Sinatra", @song.artist)
    end

end