class Locale < ApplicationRecord

def self.search(search)
		if search
			where(["nlocale LIKE ?","%#{search}%"])
		else
			all
		end
	end
	
end
