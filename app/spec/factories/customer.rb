FactoryBot.define do
    factory :customer do

        transient do
            upcased false
        end

        name Faker::Name.name
        email Faker::Internet.email
        # gender ['M','F'].sample

        trait :male do
            gender 'M'
        end

        trait :female do
            gender 'F'
        end
        
        vip false
        days_to_pay 10

        trait :vip do
            vip true
            days_to_pay 30
        end

        factory :customer_vip, traits: [:vip]

        after(:create) do |customer, evaluator|
            customer.name.upcase! if evaluator.upcased
        end

    end
end