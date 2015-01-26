class Hospital < ActiveRecord::Base
  # define relationships
  has_many :patients
  has_many :doctors, as: :doctorable
end
