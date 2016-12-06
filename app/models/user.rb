class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :scores, class_name: "GameScore"
  has_many :games, through: :scores
end
