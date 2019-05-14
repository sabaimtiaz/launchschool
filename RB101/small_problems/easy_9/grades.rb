def get_grade(grade1, grade2, grade3)
  average_grade = (grade1 + grade2 + grade3) / 3
  case average_grade
    when 90..100
      "A"
    when 80..90
      "B"
    when 70..80
      "C"
    when 60..70
      "D"
    when 0..60
      "F"
  end
end
p get_grade(95, 90, 93) 
p get_grade(50, 50, 95)