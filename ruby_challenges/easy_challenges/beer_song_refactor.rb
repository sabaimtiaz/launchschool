class BeerSong
	def initialize
		@beer_song = File.open('song.txt')
	end

	def lyrics
		@beer_song.read
	end

	def verse(number)
		verses(number, number)
	end

	def verses(start, ending)
		song = @beer_song.read.split("\n\n").reverse
		final = ''
		start.downto(ending) do |num|
			final << song[num] + "\n\n"
		end
		final.chomp
	end
end

song = BeerSong.new
#p song.verses(99, 98)
