class ExamResult < ApplicationRecord
  paginates_per 50
  belongs_to :student
  belongs_to :subject

  
end
