class Patient < ActiveRecord::Base

  # define relationships
  belongs_to :hospital
  has_many :prescriptions
  has_one :doctor, as: :commentable

  BLOOD_TYPE_OPTIONS = ['O+','O-','A+','A-',
                        'B+','B-','AB+','AB-']
  GENDER_OPTIONS = ['M','F']

  validates :name_first, :name_last, presence: true
  validate :date_of_birth_at_least_ten_years_ago
  validates_inclusion_of :gender, in: GENDER_OPTIONS
  validates_inclusion_of :blood_type, in: BLOOD_TYPE_OPTIONS
  validates :hospital_id, presence: true
  
  def date_of_birth_at_least_ten_years_ago
    ten_years_ago = Date.today << 12*10
    if self.date_of_birth > ten_years_ago
      errors.add(:date_of_birth, "must be on or before #{ten_years_ago}")
    end
  end
  
  def isFemale?
    return self.gender == 'F'
  end

  def isMale?
    return self.gender == 'M'
  end
  
end
