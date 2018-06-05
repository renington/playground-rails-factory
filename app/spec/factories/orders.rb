FactoryBot.define do
  factory :order do
    # description "MyString"
    sequence(:description) { |num| "Order number #{num}" }
    customer
  end
end
