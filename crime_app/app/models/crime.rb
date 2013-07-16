class Crime < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :neighborhoods
end
