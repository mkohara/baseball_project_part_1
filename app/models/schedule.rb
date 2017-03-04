class Schedule < ApplicationRecord
  # Direct associations

  belongs_to :home_team,
             :class_name => "Team"

  # Indirect associations

  # Validations

end
