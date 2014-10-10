class Tag < ActiveRecord::Base
  belongs_to(:movie)
end