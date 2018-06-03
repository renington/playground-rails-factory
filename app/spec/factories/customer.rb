FactoryBot.define do
    factory :customer do

        transient do
            upcased false
        end

        # Dinamic Attributes
        # Segundo a documentação deve ser usadas as chaves 
        name { Faker::Name.name }
        
        # email { Faker::Internet.email }
        # sequence(:email) do |n|
        # end
        sequence(:email) { |n| "my-email-#{n}@email.com" }

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
        factory :customer_vip_female, traits: [:vip, :female]

        after(:create) do |customer, evaluator|
            customer.name.upcase! if evaluator.upcased
        end

    end
end