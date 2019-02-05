def execute(&block)
  block.call
end

execute do 
  puts "Hello from inside the execute method"
end
