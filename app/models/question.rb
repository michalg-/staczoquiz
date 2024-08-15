class Question < ApplicationRecord
  belongs_to :game
  belongs_to :correct_choice, optional: true, class_name: "Choice"
  has_many :choices, dependent: :delete_all
end
