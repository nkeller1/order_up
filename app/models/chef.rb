class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def self.most_popular_items
    require "pry"; binding.pry
  end
end
