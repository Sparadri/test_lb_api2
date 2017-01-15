class Collectioner < ActiveRecord::Base
  has_many :collections, dependent: :destroy
  has_many :products, through: :collections

  validates :first_name, presence: true, uniqueness: { scope: :last_name }
end
