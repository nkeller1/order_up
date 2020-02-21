require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients) }
  end

  it "calculates total calories" do
    chef_1 = Chef.create(name: "Billy")

    dish_1 = chef_1.dishes.create!(
      name: "Fun Food",
      description: "Really Nice",
    )
    ingredient_1 = Ingredient.create(name: "Frosting", calories: 600)
    ingredient_2 = Ingredient.create(name: "Cake", calories: 50)
    ingredient_3 = Ingredient.create(name: "sprinkles", calories: 50)

    dish_1.ingredients << [ingredient_1, ingredient_2, ingredient_3]

    expect(dish_1.total_calories).to eq(700)
  end
end
