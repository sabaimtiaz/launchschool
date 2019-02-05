contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|#add additional block parameter for idx
  fields.each do |field|
    hash[field] = contact_data[idx].shift #as we iterate through fields array we can ref the contact data element at the right index
  end
end
puts contacts