flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
for flint in flintstones
  puts flint[0..2]
end

flintstones.map! {|name| name[0..3]}
