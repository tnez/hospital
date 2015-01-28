class Patient < ActiveRecord::Base
  has_many :cases
  has_many :notes, as: :noteable
  BLOOD_TYPES = %w(O+ O- B+ B- A+ A- AB+ AB-)
  GENDERS = %w(M F)
end
