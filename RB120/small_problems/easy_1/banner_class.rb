class Banner
  def initialize(message, banner_width = 0)
    @message = message
    @banner_width = message.length 
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  def ask_banner
    puts "Do you want to change the banner width? Enter y for yes, n for no"
    answer = gets.chomp
    if answer == "y"
      puts "What width do you want?"
      @banner_width = gets.chomp.to_i
      until @banner_width >= @message.size
        puts "Your banner width is too small."
        puts "Enter a new width, it has to be greater than #{@message.size}"
        @banner_width = gets.chomp.to_i
        puts "Here's your banner!"
      end
    elsif answer == "n" 
      puts "You entered n or an incorrect input. The default width is the length of the message. Here's your banner!"
    end
  end

  private

  def horizontal_rule
    "+-#{"-" * (@banner_width)}-+"
  end

  def empty_line
    "| #{" " * (@banner_width)} |"
  end

  def message_line
    " #{@message.center(@banner_width)} "
  end
end

banner = Banner.new("To boldly go where no one has gone before")
puts banner.ask_banner
puts banner
