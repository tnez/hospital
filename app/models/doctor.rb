class Doctor < ActiveRecord::Base
  # relationships
  belongs_to :doctorable, polymorphic: true
  # validation
  validates :first_name, :last_name, presence: true
end
