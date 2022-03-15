require 'rails_helper'

RSpec.feature "Visitor checks the product details", type: :feature, js:true do
  
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

      visit root_path
    end
  end

  scenario "They see the product details on clicking the product image" do
    page.all("img").first.click

    save_screenshot
    expect(page).to have_content("Description")
  end

  scenario "They see the product details on clicking the product image" do
    page.all("footer.actions").first.click_on 'Details'

    save_screenshot
    expect(page).to have_content("Description")
  end
end
