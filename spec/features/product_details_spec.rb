require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      product = @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "They see product details" do
    # ACT
    visit root_path
    find('article header').click

    # DEBUG / VERIFY
    expect(page).to have_css '.product-detail .main-img', count: 1
    save_screenshot('product_details.png')
  end

end
