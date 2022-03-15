require 'rails_helper'

RSpec.feature "Visitor adds product to cart", type: :feature, js: true  do
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

    scenario "they add a product to cart" do
      page.all("footer.actions").first.click_on "Add"
      save_screenshot

      expect(page.has_css?("nav.navbar li", text: "My Cart (1)")).to be_truthy
    end
end
