
def minilang(program)
  stack = []
  register = 0
  program.split.each do |command|
    case command
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PUSH' then stack.push(register)
    when 'PRINT' then puts register
    else register = command.to_i
    end
  end
end

# further exploration
# (3 + (4 * 5) - 7) / (5 % 3)
minilang('3 PUSH PRINT 5 MOD PUSH PRINT 7 PUSH PRINT 4 PUSH PRINT 5 MULT PRINT PUSH 3 PRINT ADD PRINT SUB PRINT DIV PRINT')
