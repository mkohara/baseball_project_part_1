class Player < ApplicationRecord
  # Direct associations

  has_many   :notes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
