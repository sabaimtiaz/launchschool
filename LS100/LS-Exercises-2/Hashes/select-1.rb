numbers = {
  high: 100,
  medium: 50,
  low: 10
}

low_numbers = numbers.select! do |key, value|
  value < 25
end

p low_numbers
p numbers