class AssignedPlayer < ApplicationRecord
  # Direct associations

  belongs_to :scout,
             :counter_cache => true

  # Indirect associations

  # Validations

end
