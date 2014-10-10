class Movie < ActiveRecord::Base
  has_many(:tags)
end