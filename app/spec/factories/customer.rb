FactoryBot.define do
    factory :customer do
        name Faker::Name.name
        email Faker::Internet.email
        vip false
        days_to_pay 10

        factory :customer_vip do
            vip true
            days_to_pay 30
        end

    end
end