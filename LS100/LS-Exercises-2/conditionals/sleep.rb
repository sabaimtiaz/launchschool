status = ['awake', 'tired'].sample

answer = if status == 'awake'
   "Be productive!"
else 
  "Go to sleep!"

end

puts answer 
