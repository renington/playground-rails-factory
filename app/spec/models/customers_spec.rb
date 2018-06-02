require 'rails_helper'

describe Customer, type: :model do

    fixtures :customers

    it '#full_name' do
        customer = customers(:renington)
        expect(customer.full_name).to start_with('Sr. ')
    end

    it 'Create a customer by FactoryBot' do
        customer = create(:customer)
        expect(customer.full_name).to start_with('Sr. ')
    end

    it 'Create a customer by FactoryBot and set a name' do
        customer = create(:customer, name: 'Renington Neri')
        expect(customer.full_name).to start_with('Sr. Renington Neri')
    end

    it 'customer default' do
        customer = create(:customer)
        expect(customer.vip).to eq(false)
    end

    it 'customer vip' do
        customer = create(:customer_vip)
        expect(customer.vip).to eq(true)
    end

    it 'attributes_for' do
        attrs = attributes_for(:customer)
        customer = Customer.create(attrs)
        expect(customer.full_name).to start_with('Sr. ')
    end

    it 'attribute trasient' do
        customer = create(:customer, upcased: true)
        expect(customer.name.upcase).to eq(customer.name)
    end

    it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) }
end