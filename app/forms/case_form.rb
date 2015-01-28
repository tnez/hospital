class CaseForm < Reform::Form
  property :description
  property :patient_id
  collection :symptoms do
    property :description
  end
end
