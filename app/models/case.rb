class Case < ActiveRecord::Base
  belongs_to :patient
  has_many :case_symptoms
  has_many :symptoms, through: :case_symptoms
  has_many :notes, as: :noteable
end
