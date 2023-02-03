require 'rails_helper'

RSpec.describe UserMessage, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:conversation) }
    it { is_expected.to belong_to(:sender).class_name('User').with_foreign_key('sender_id') }
  end
end