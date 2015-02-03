class Patient < ActiveRecord::Base

  include Addressable
  # street1
  # street2
  # city
  # state
  # country
  # zipcode

  include Nameable
  # first
  # middle
  # last
  # title
  # to_s (title first last)

  has_many :cases
  has_many :notes, as: :noteable
  BLOOD_TYPES = %w(O+ O- B+ B- A+ A- AB+ AB-)
  GENDERS = %w(M F)

end
