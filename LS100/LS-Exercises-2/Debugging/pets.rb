pets = {cat: 'fluffy', dog: ['sparkly', 'fido'], fish: 'oscar'}
pets[:dog][2] = 'bowser'
#pets[:dog].push('bowser')
p pets #=> {:cat=>"fluffy", : dog=>"bowser", :fish=>"oscar"}
