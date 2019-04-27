hash = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]

hash.map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item
      item > 13
      else
        item.size < 6
      end
  end
end
