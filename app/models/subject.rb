class Subject < ApplicationRecord
    has_many :exam_results
    has_many :studetns, through: :exam_results
end
