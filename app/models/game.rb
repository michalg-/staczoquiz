class Game < ApplicationRecord
  has_many :sessions, class_name: "GameSession"
  has_many :questions
end
