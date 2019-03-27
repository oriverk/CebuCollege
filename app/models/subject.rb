class Subject < ApplicationRecord
    has_many :exam_results
    has_many :studetns, through: :exam_results

    validates :name, presence: true
    validates :name, length: { minimum: 2 }
    validates :name, length: { maximum: 255 }

end
