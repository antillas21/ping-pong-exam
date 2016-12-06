class Game < ActiveRecord::Base
  validates :played_on, presence: true, allow_nil: false, allow_blank: false
end
