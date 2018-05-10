class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates_associated :ingredient
  validates_associated :cocktail
  validates :description, presence: true
  validates :ingredient, presence: true, allow_blank: false
  validates_uniqueness_of :cocktail_id, :scope => [:ingredient_id]
end
