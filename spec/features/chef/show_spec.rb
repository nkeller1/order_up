require 'rails_helper'

RSpec.describe Chef, type: :feature do
  describe "chef show page" do
    it "can see the chefs information" do

      chef_1 = Chef.create(name: "Billy")

      dish_1 = chef_1.dishes.create!(
        name: "Fun Food",
        description: "Really Nice",
      )

      ingredient_1 = Ingredient.create(name: "Frosting", calories: 600)
      ingredient_2 = Ingredient.create(name: "Cake", calories: 40)
      ingredient_3 = Ingredient.create(name: "sprinkles", calories: 50)

      dish_1.ingredients << [ingredient_1, ingredient_2, ingredient_3]

      visit "chefs/#{chef_1.id}"

      expect(page).to have_content(chef_1.name)
      click_link("All Ingredients")
      expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
    end

    it "can rank the most popular ingredients" do

      chef_1 = Chef.create(name: "Billy")

      dish_1 = chef_1.dishes.create!(
        name: "Fun Food",
        description: "Really Nice",
      )

      dish_2 = chef_1.dishes.create!(
        name: "Yum",
        description: "Not spicy",
      )
      ingredient_1 = Ingredient.create(name: "Frosting", calories: 600)
      ingredient_2 = Ingredient.create(name: "Cake", calories: 40)
      ingredient_3 = Ingredient.create(name: "sprinkles", calories: 50)

      dish_1.ingredients << [ingredient_1, ingredient_2, ingredient_3]

      dish_2.ingredients << [ingredient_1, ingredient_2]

      visit "chefs/#{chef_1.id}"

      expect(page).to have_content("Most Popular Items")
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
    end
  end
end
