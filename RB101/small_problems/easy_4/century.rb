def century(year)
  century = year / 100 + 1
  p century.to_s + century_ending(century)
end

def century_ending(century)
  return "th" if [11, 12, 13].include?(century % 100)

  last_digit = century.digits.reverse.last
  case last_digit
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
  end
end

century(2000)
century(1998)
century(5)
century(1052)
century(1245)
century(24)
