
# LS solution
def find_dup(array)
  array.find { |element| array.count(element) == 2}
end
find_dup([1, 5, 3, 1])

def find_dup(array)
  array.map do |element|
    if array.count(element) > 1
      return element
    end
  end
end
given_array = [5, 4, 3, 2, 1, 5]
p find_dup(given_array)