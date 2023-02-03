FactoryBot.define do
    factory :conversation do
      sender { nil }
      recipient { nil }
  
      # trait :with_users do
      #   association :sender, factory: :user
      #   association :recipient, factory: :user
      # end
    end
  end