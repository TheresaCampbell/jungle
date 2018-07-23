require 'rails_helper'

RSpec.describe Product, type: :model do

  # context "Validations:" do
  #   it { is_expected.to validate_presence_of(:name) }
  #   it { is_expected.to validate_presence_of(:price) }
  #   it { is_expected.to validate_presence_of(:quantity) }
  #   it { is_expected.to validate_presence_of(:category) }
  # end

  describe 'Validations' do

    before :each do
      @category = Category.new(name: 'Books')
      @product = Product.new(name: 'Fancy Book', price: 100, quantity: 10, category: @category)
    end

    it 'should save if all parameters are filled out' do
      @missing_parameter = Product.new(price: 100, quantity: 10, category: @category)
      expect(@product).to be_a Product
      expect(@missing_parameter).to be_invalid
    end

    it 'should have a name' do
      @no_name = Product.new(price: 100, quantity: 10, category: @category)
      expect(@product.name).to be_present
      expect(@no_name.name).to be_nil
    end

    it 'should have a price' do
      @no_price = Product.new(name: 'Fancy Book', quantity: 10, category: @category)
      expect(@product.price).to be_present
      expect(@no_price.price).to be_nil
    end

    it 'should have a quantity' do
      @no_quantity = Product.new(name: 'Fancy Book', price: 100, category: @category)
      expect(@product.quantity).to be_present
      expect(@no_quantity.quantity).to be_nil
    end

    it 'should have a category' do
      @no_category = Product.new(name: 'Fancy Book', price: 100, quantity: 10)
      expect(@product.category).to be_present
      expect(@no_category.category).to be_nil
    end
  end
end
