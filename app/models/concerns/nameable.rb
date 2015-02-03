module Nameable
  extend ActiveSupport::Concern

  included do
    has_one :name, as: :nameable
    delegate :first_name,
      :middle_name,
      :last_name,
      :suffix,
      :title,
      to: :name
  end
end
