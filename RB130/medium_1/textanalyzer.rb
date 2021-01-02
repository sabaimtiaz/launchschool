class TextAnalyzer
  def process
   	text = File.open("sample_text.txt", "r")
   	yield(text.read)
   	text.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count } paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count } lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }
