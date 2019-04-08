flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index{|x| x[0, 2] == "Be"}