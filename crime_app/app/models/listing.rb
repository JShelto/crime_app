class Listing < ActiveRecord::Base
  # attr_accessible :
  
  belongs_to :neighborhoods
end
