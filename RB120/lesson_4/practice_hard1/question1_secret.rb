require 'Date'

class SecretFile
	attr_accessor :data, :logger

	def initialize(secret_data)
		@data = secret_data
	end
end

class SecurityLogger
	attr_accessor :name, :logger, :day
	@@day = Date.today

	def initialize
		@logger = 0
		@name = name
	end

	def add_log_attempt
		@name = "guest"
		@logger += 1
	end

	def to_s
		"#{logger} login attempts were made by #{name} on #{@@day}."
	end
end

file = SecretFile.new("TopSecret")
login_attempt = SecurityLogger.new
login_attempt.add_log_attempt
file.logger = login_attempt
puts file.logger

#LS
class SecretFile
  attr_reader :data

  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end
end

class SecretFile
  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end
