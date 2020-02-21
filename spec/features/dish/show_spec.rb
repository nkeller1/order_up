require 'rails_helper'

RSpec.describe Dish, type: :feature do
  describe "dish show page" do
    it "can see the dish information" do

      chef_1 = Chef.create(name: "Billy")

      dish_1 = Dish.create(name: "Fun Food", description: "Really Nice", chef_id: chef_1)

      ingredient_1 = Ingredient.create(name: "Frosting", calories: 600)
      ingredient_2 = Ingredient.create(name: "Cake", calories: 40)
      ingredient_3 = Ingredient.create(name: "sprinkles", calories: 50)

      dish_1.ingredients << [ingredient_1, ingredient_2, ingredient_3]

      visit "/dishes/#{dish_1.id}"

      expect(page).to have_content(chef_1.name)
      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(dish_1.description)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
    end
  end
end
