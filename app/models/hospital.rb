class Hospital < ActiveRecord::Base
  # define relationships
  has_many :patients
end
