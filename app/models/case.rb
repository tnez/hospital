class Case < ActiveRecord::Base
  belongs_to :patient
  has_many :symptoms, through: :case_symptoms
  has_many :notes, through: :noteable
end
