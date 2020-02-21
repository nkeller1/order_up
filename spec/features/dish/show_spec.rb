require 'rails_helper'

RSpec.describe Dish, type: :feature do
  describe "dish show page" do
    it "can see the dish information" do

      chef_1 = Chef.create(name: "Billy")

      dish_1 = chef_1.dishes.create!(
        name: "Fun Food",
        description: "Really Nice",
      )
      ingredient_1 = Ingredient.create(name: "Frosting", calories: 600)
      ingredient_2 = Ingredient.create(name: "Cake", calories: 40)
      ingredient_3 = Ingredient.create(name: "sprinkles", calories: 50)

      dish_1.ingredients << [ingredient_1, ingredient_2, ingredient_3]

      visit "/dishes/#{dish_1.id}"

      expect(page).to have_content(chef_1.name)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
    end

    it "shows me the total calories of the dish" do

      chef_1 = Chef.create(name: "Billy")

      dish_1 = chef_1.dishes.create!(
        name: "Fun Food",
        description: "Really Nice",
      )
      ingredient_1 = Ingredient.create(name: "Frosting", calories: 600)
      ingredient_2 = Ingredient.create(name: "Cake", calories: 50)
      ingredient_3 = Ingredient.create(name: "sprinkles", calories: 50)

      dish_1.ingredients << [ingredient_1, ingredient_2, ingredient_3]

      visit "/dishes/#{dish_1.id}"

      expect(page).to have_content("700 total calories")
    end
  end
end
