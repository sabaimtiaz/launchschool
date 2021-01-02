class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
  	return unless block_given?
  	recording = yield
  	record(recording)
  end

  def play
  	@recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
p listener.play # Outputs "Hello World!"