class Product < ActiveRecord::Base

  include Filterable

  after_initialize :default_values


  # ASSOCATIONS / VALIDATIONS

  # products must belong to a collection, to be assigned a collectioner
  belongs_to :collection
  belongs_to :collectioner

  # many-to-many relationships, with joint table products_categories
  has_many :product_categories, class_name: 'ProductCategory', dependent: :destroy
  has_many :categories, through: :product_categories

  # data validation
  # to do: add uniqueness on scope?
  validates :title, presence: true
  validates :collection_id, presence: true
  # validates :category_id, presence: true   > does not exist anymore



  # SORTING

  # default product sorting set to recency
  default_scope { order(created_at: :desc) }

  # all columns are available for sorting and ordered ASC | recency is ordered DESC
  scope :sort_by, -> (column_name) do
    column_name == "recency" ? reorder("created_at DESC") : reorder("#{column_name} ASC")
  end



  # FILTERING

  # filters for categories can have multiple categories
  # note: scope should not return an array but an activeRecordAssociation (?)
  # to do: write something more effective?
  scope :category, -> (category_ids) do
    query = category_ids.split('-').map { |id| "category_id = #{id}"}.join(" OR ")
    self.joins(:product_categories).where(query)
  end

  # collectioner filter can have multiple collectioners
  # note: scope should not return an array but an activeRecordAssociation (?)
  # to check: sql query should not be = but WHERE ... IN
  scope :collectioner, -> (collectioner_ids) do
    query = collectioner_ids.split('-').map { |id| "collectioner_id = #{id}"}.join(" OR ")
    self.joins(:collection).where(query)
  end

  private

  # set "is_live" to false when first created if not specified
  def default_values
    # on product creation, is_live set to false by default
    self.is_live ||= false
  end
end
