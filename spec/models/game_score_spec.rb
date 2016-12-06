require 'rails_helper'

RSpec.describe GameScore, type: :model do
  it { is_expected.to belong_to :game }
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :score }
  it { is_expected.to validate_presence_of :game_id }
  it { is_expected.to validate_presence_of :user_id }
end
