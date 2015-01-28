class Patient < ActiveRecord::Base
  BLOOD_TYPES = %w(O+ O- B+ B- A+ A- AB+ AB-)
  GENDERS = %w(M F)
end
