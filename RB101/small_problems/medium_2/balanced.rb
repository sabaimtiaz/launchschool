def balanced?(string)
  parens = 0
  string.each_char do |char| 
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end
  parens.zero?
end
p balanced?("cof(ff)ee")
p balanced?("cof(fee")
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

 # p string.chars.count(PARENS[0])
 # # p string.chars.count(PARENS[1])
 # (string =~ /\(/) == (string =~ /\)/)

SYMBOLS = {
  '(' => ')', '<' => '>', '[' => ']', "'" => "'", '""' => '""'
 }
def balanced_chars?(string)

  symbol_count = 0
  string.each_char do |char| 
    symbol_count += 1 if SYMBOLS.keys.include?(char)
    symbol_count -= 1 if SYMBOLS.values.include?(char)
    break if symbol_count < 0
  end
  symbol_count.zero?
end
p balanced_chars?("cof(ff)e[e]")
p balanced_chars?('What (is) t[h]is?') #== true
p balanced_chars?('What ((is))) u>p(')
p balanced_chars?(']')