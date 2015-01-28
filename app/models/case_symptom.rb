class CaseSymptom < ActiveRecord::Base
  belongs_to :case
  belongs_to :symptom
end
