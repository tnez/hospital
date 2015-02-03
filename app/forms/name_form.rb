module NameForm
  include Reform::Form::Module

  property :name do
    property :title
    property :first_name, validates: {presence: true}
    property :middle_name
    property :last_name, validates: {presence: true}
    property :suffix
  end

end
