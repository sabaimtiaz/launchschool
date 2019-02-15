contact_data = ["joe@email.com", "123 Main St", "0300231"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contacts.each do |key, value|
  fields.each do |field|
   value[field] = contact_data.shift
  #puts key #shows name
  #puts value #shows empty hash
  end
end
puts contacts
