def group(array)
	yield(array) 
end
birds = %w(raven finch hawk eagle)
raptors = []
group(birds) { |bird| raptors << birds[-2..-1] }
p raptors.flatten
