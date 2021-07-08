class Clock
	attr_accessor :hours, :mins, :total

	HOURS_DAY = 24
	HOURS_MIN = 60
	TOTAL_DAY = HOURS_MIN * HOURS_DAY

	def initialize(mins)
		@mins = mins
	end

	def self.at(hours, mins=0)
		total_mins = hours * HOURS_MIN + mins
		self.new(total_mins)
	end

	def +(add_minutes)
		Clock.new(mins + add_minutes)
	end

	def -(sub_minutes)
		Clock.new(mins - sub_minutes)
	end

	def convert_time(total_mins)
	 	_, leftover = total_mins.divmod(TOTAL_DAY)
	 	leftover.divmod(HOURS_MIN)
	end

	def to_s
		time = convert_time(mins)
		format('%02d:%02d', time[0], time[1]);
	end

	def ==(other)
		to_s == other.to_s
	end
end


