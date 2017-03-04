class Player < ApplicationRecord
  # Direct associations

  has_many   :is_favorited_by_scout,
             :class_name => "Favorite"

  has_many   :assigned_to_a_scout,
             :class_name => "AssignedPlayer",
             :dependent => :destroy

  has_many   :notes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
