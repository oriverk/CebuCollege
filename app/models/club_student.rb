class ClubStudent < ApplicationRecord
  paginates_per 50
  belongs_to :student
  belongs_to :club
end
