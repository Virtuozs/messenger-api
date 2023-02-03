require 'rails_helper'

RSpec.describe User, type: :model do
  # ENsure has 1:m relationships with conversations model
  describe "associations" do
    it { is_expected.to have_many(:conversations) }
    it { is_expected.to have_many(:received_conversations) }
    it { is_expected.to have_many(:user_messages).through(:conversations) }
    it { is_expected.to have_many(:received_messages).through(:received_conversations).source(:user_messages) }
  end
end
