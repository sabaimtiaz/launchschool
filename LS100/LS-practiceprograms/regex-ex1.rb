def has_word?(string)
  if /lab/i.match(string)
    puts string
  end
end

has_word?("laboratory")
has_word?("experiment")
has_word?("Pans Labyrinth")
has_word?("elaborate")
has_word?("polar bear")