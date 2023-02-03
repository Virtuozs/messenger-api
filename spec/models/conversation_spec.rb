require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:sender).class_name('User').with_foreign_key(:sender_id) }
    it { is_expected.to belong_to(:recipient).class_name('User').with_foreign_key(:recipient_id) }
    it { is_expected.to have_many(:user_messages) }
  end
end
