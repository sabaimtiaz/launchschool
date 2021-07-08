class Robot
	attr_accessor :name, :used_names

	@@used_names = []
	
	NUMS = (0..9).to_a
	ALPHA = ('A'..'Z').to_a

	def generate_name
		(ALPHA.sample(2) << NUMS.sample(3)).join
	end

	def name
		return @name if @name
		@name = generate_name while @@used_names.include?(@name) || @name.nil?
		@@used_names << @name
		@name
	end

	def reset
		@@used_names.delete(@name)
		@name = nil
	end
end

