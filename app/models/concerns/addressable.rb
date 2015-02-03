module Addressable
  extend ActiveSupport::Concern

  included do
    has_one :address, as: :addressable
    delegate :street1,
      :street2,
      :city,
      :state,
      :country,      
      :zipcode,
      to: :address
    end
end
