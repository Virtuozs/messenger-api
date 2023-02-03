FactoryBot.define do
    factory :user_message do
        body { Faker::Lorem.sentence }
        conversation
        association :sender, factory: :user
    end
  end