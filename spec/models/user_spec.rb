require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:scores).class_name("GameScore") }
  it { is_expected.to have_many(:games).through(:scores) }
end
