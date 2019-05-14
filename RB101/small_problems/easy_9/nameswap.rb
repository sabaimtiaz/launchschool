
def swap_name(string)
  string_swap = string.split(' ').reverse
  string = string_swap[0] + ", " + string_swap[1]
  string
end
p swap_name('Joe Roberts') == 'Roberts, Joe'


# LS solution
string_swap = string.split('  ').reverse.join(', ')