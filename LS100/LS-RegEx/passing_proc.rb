def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end
end #calls number

proc = Proc.new do |number|
  puts "#{number}. Proc being called in the method."
end #adds the number with the proc

take_proc(proc)