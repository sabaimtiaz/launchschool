class Fixnum
	ROMAN_NUMERAL_RULES = {
		"M"=>1000,
		"CM"=>900, 
		"D"=>500,
		"CD"=>400,
		"C"=>100,
		"XC"=>90,
		"L"=>50,
		"XL"=>40,
		"X"=>10,
		"IX"=>9,
		"V"=>5,
		"IV"=>4,
		"I"=> 1
	}

	def to_roman
		roman_numeral = ""
		number = self
		ROMAN_NUMERAL_RULES.each do |roman_number, value|
			number_of_roman_letters = number / value
			roman_numeral += roman_number * number_of_roman_letters 
			number -= number_of_roman_letters * value
		end
		roman_numeral
	end
end

