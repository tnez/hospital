class Patient < ActiveRecord::Base
  has_many :cases
  BLOOD_TYPES = %w(O+ O- B+ B- A+ A- AB+ AB-)
  GENDERS = %w(M F)
end
