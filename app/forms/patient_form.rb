class PatientForm < Reform::Form

  include NameForm
  # property :title, validates: {inclusion: Name::TITLES}
  # property :first_name, validates: {presence: true}
  # property :middle_name
  # property :last_name, validates: {presence: true}
  # property :suffix

  property :date_of_birth
  property :gender
  property :blood_type

  validate :meets_age_requirement?
  validates :gender, inclusion: {in: Patient::GENDERS}
  validates :blood_type, inclusion: {in: Patient::BLOOD_TYPES}

  def meets_age_requirement?
    if date_of_birth && date_of_birth > 10.years.ago
      errors.add(:date_of_birth, "Patients must be at least 10 years old")
    end
  end

end
