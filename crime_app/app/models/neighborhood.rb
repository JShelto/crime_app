class Neighborhood < ActiveRecord::Base
  # attr_accessible :title, :body

 has_many :listings
 has_many :crimes
end
