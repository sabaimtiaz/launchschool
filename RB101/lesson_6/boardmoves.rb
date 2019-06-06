board = {1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
range = []
board.map do |keys, values|
   if values == "X"
    range << keys 
  end
end

