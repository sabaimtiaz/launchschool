

def decrypt(names)
	alphabet = ('a'..'z').to_a
	caps = ('A'..'Z').to_a
	names.map do |person|
		person.chars.map.with_index do |char, idx| 
			if alphabet.include?(char)
				if /[a-z]/.match((char.ord-13).chr)
					(char.ord-13).chr
				elsif /[^a-z]/.match((char.ord-13).chr)
					(char.ord+13).chr
				else
					char
				end
			elsif caps.include?(char)
				if /[A-Z]/.match((char.ord-13).chr)
					(char.ord-13).chr
				elsif /[^A-Z]/.match((char.ord-13).chr)
					(char.ord+13).chr
				else
					char
				end
			else
				char
			end
		end.join
	end
end


 array = ["Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar","Nyna Ghevat", "Puneyrf Onoontr", "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv", "Wbua Ngnanfbss",
 				"Ybvf Unvog", "Pynhqr Funaaba", "Fgrir Wbof", "Ovyy Tngrf", "Gvz Orearef-Yrr", "Fgrir Jbmavnx", "Xbaenq Mhfr", "Fve Nagbal Ubner", "Zneiva Zvafxl", 
 				"Lhxvuveb Zngfhzbgb", "Unllvz Fybavzfxv", "Tregehqr Oynapu"]

p decrypt(array)