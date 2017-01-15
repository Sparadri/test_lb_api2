class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  # many-to-many relationships with joint table products_categories
  has_many :product_categories, class_name: 'ProductCategory'
  has_many :products, through: :product_categories

end
