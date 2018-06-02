require 'rails_helper'

describe Customer, type: :model do

    fixtures :customers

    it 'Create a customer' do
        customer = customers(:renington)
        expect(customer.full_name).to eq('Sr. Renington Neri')
    end

    it 'Create a customer by FactoryBot' do
        customer = create(:customer)
        expect(customer.full_name).to eq('Sr. Renington Neri')
    end
end