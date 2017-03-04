class AssignedPlayer < ApplicationRecord
  # Direct associations

  belongs_to :player,
             :counter_cache => :assigned_to_a_scout_count

  belongs_to :scout,
             :counter_cache => true

  # Indirect associations

  # Validations

end
