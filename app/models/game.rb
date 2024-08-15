class Game < ApplicationRecord
  has_many :sessions, class_name: "GameSession", dependent: :delete_all
  has_many :questions, dependent: :delete_all
end
