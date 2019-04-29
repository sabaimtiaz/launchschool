

nums = 0..9
alphas = 'a'..'f'
arr = []
nums.each do |num| 
  arr << num.to_s
end

alphas.each do |alpha|
  arr << alpha.to_s
end

uuid_one = ""
8.times do
  uuid_one += arr.sample
end

uuid_two = ""
4.times do 
  uuid_two += arr.sample
end

uuid_three = ""
4.times do 
  uuid_three += arr.sample
end

uuid_four = ""
4.times do 
  uuid_four += arr.sample
end

uuid_five = ""
12.times do 
  uuid_five += arr.sample
end

uuid = "#{uuid_one}-#{uuid_two}-#{uuid_three}-#{uuid_four}-#{uuid_five}"

# LS solution
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s } 
  ('a'..'f').each { |letter| characters << letter }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1 
  end
  uuid
end

