class BeerSong
	attr_accessor :words, :file

	def lyrics
		@file = File.open("song.txt", "r")
		@words = file.read
	end

	def first_verse
		"99 bottles of beer on the wall, 99 bottles of beer.\n" \
     "Take one down and pass it around, 98 bottles of beer on the wall.\n"
	end

	def last_verse
		"No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
	end

	def verse_one
		"1 bottle of beer on the wall, 1 bottle of beer.\n" \
		"Take it down and pass it around, no more bottles of beer on the wall.\n"
	end

	def verse(number)
		case number
		when 99
			first_verse
		when 0
			last_verse
		when 2
			"#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
			"Take one down and pass it around, #{number-1} bottle of beer on the wall.\n"
		when 1
			verse_one
		else
			"#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
			"Take one down and pass it around, #{number-1} bottles of beer on the wall.\n"
		end
	end

	def verses(start, ending)
		str = ''
		start.downto(ending) do |num|
			str << verse(num) +  "\n" \
		end
		str.chomp
	end
end


