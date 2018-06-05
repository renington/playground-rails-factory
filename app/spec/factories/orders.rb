FactoryBot.define do
  factory :order do
    # description "MyString"
    sequence(:description) { |num| "Order number #{num}" }
    customer
    # association :customer, factory: :customer
  end
end
