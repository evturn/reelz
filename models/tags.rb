class Tag < ActiveRecord::Base
	belong_to(:movie)
end