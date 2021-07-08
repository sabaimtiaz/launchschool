class Clock
	attr_accessor :hours, :mins, :total

	HOURS_DAY = 24
	HOURS_MIN = 60
	TOTAL_DAY = HOURS_MIN * HOURS_DAY

	def initialize(hours, mins)
		@hours = hours
		@mins = mins
		@total = convert_hours
	end

	def self.at(hours, mins=0)
		new(hours, mins)
		self.new(hours, mins)
	end

	def check_midnight
		@hours == 0 ? @hours = 24 : @hours 
	end

	def convert_hours
		@hours = check_midnight
		@hours * HOURS_MIN + @mins
	end

	def +(add_minutes)
		@total += add_minutes
		@total = convert_time
		to_s
	end

	def -(sub_minutes)
		@total -= sub_minutes
		@total = convert_time
		to_s
	end

	def convert_time
	 	@total.divmod(HOURS_MIN)
	end

	def check_time
		@total == convert_hours ? @total = convert_time : @total
		@total[0] == 24 ? @total[0] = 0 : @total 
	end

	def to_s
		total = check_time
		format('%02d:%02d', @total[0], @total[1]);
	end

	def ==(other)
		to_s == other.to_s
	end
end

clock1 = Clock.at(10)
p clock1


