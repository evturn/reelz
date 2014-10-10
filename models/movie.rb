class Movie < ActiveRecord::Base
  has_many(:tags)
  has_many(:comments)
end