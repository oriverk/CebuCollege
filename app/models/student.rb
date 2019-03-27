class Student < ApplicationRecord
  paginates_per 30
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exam_results
  has_many :subjects, through: :exam_results
  has_many :club_students
  has_many :clubs, through: :club_students

  enum gender: { male: 0, female: 1 }
  enum age: { teen: 0, twenties: 1, thirties: 2 }
end
