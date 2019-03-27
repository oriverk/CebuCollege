class Club < ApplicationRecord
    has_many :clubs_students
    has_many :studetns, through: :club_students
    validates :name, presence: true
    validates :name, exclusion: { in: %w(部 サークル) }
    validates :name, length:{minimum:2}
    validates :name, length:{maximum:255}
    

end
