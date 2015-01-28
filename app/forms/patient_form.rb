class PatientForm < Reform::Form
  property :name_first
  property :name_last
  property :date_of_birth
  property :gender
  property :blood_type

  validates :name_first, :name_last, presence: true
  validate :meets_age_requirement?
  validates :gender, inclusion: {in: Patient::GENDERS}
  validates :blood_type, inclusion: {in: Patient::BLOOD_TYPES}

  def meets_age_requirement?
    if date_of_birth && date_of_birth > 10.years.ago
      errors.add(:date_of_birth, "Patients must be at least 10 years old")
    end
  end

  
end
