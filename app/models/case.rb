class Case < ActiveRecord::Base
  belongs_to :patient
  has_many :case_symptoms
  has_many :symptoms, through: :case_symptoms
  has_many :notes, as: :noteable

  include Workflow
  workflow do
    state :new do
      event :approve, :transitions_to => :approved
      event :close, :transitions_to => :closed
    end
    state :approved do
      event :assign, :transitions_to => :assigned
    end
    state :assigned do
      event :close, :transitions_to => :closed
    end
    state :closed
  end

  searchable do
    text :description
    text :notes do
      notes.map { |note| note.content }
    end
    text :patient do
      patient.full_name
    end
    text :symptoms do
      symptoms.map { |symptom| symptom.description }
    end
  end
end
