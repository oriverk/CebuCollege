class ExamResult < ApplicationRecord
  paginates_per 30
  belongs_to :student
  belongs_to :subject

  
end
