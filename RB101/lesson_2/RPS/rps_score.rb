def win?(num1, num2)
  score = 0
  if num1 < num2
    puts 'you win'
    until score >= 5
      score = score+=1
      return score
    end
  end
end
win?(2, 4)

