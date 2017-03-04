class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :player,
             :counter_cache => :is_favorited_by_scout_count

  belongs_to :scout,
             :counter_cache => true

  # Indirect associations

  # Validations

end
