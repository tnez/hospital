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

  searchable do
    text :first_name,
      :middle_name,
      :last_name
    text :notes do
      notes.map { |note| note.content }
    end
  end

  def full_name
    [title,first_name,middle_name,last_name,suffix].join(' ').strip
  end
end
