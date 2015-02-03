class Name < ActiveRecord::Base
  belongs_to :nameable, polymorphic: true, touch:true

  TITLES=%W(Mr. Mrs. Ms. Dr.)

  def to_s
    [title,first_name,last_name,suffix].join(' ')
  end
  
end
