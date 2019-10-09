
BLOCKS = ["BO", "XK", "DQ", "CP", "NA",
"GT", "RE", "FS", "JW", "HU", "VI", "LY","ZM"]
def block_word?(word)
  transform_word = word.upcase
  BLOCKS.each do |pair|
    pair.split(' ').each do |chr| 
      if transform_word.count(chr) == 2 
        return false
      elsif transform_word.include?(chr[0]) && transform_word.include?(chr[1]) 
        return false
      elsif transform_word.count(chr) == 1 && transform_word.count(chr) > 2
        return true
      end
    end
  end
  true
end
p block_word?('BATCH') 
p block_word?('BOJ')
p block_word?('BUTCH')
p block_word?('jest')
p block_word?("BOKX")

