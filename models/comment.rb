class Comment < ActiveRecord::Base
	belongs_to(:movie)
end

# id
# movie_id
# bod