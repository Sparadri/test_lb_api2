class Collection < ActiveRecord::Base

  include Filterable

  after_initialize :default_values

  belongs_to :collectioner
  has_many :products, dependent: :destroy
  has_many :interviews, dependent: :destroy

  validates :title, presence: :true, uniqueness: true
  validates :collectioner, presence: :true


  # SCOPES / FILTERING / ORDERING

  # default collection sorting set to recency
  default_scope { order(created_at: :desc) }

  # all columns are available for sorting and ordered ASC | recency is ordered DESC
  scope :sort_by_recency, -> { reorder(created_at: :desc) }

  # NOT WORKING - scope is called is with nil value for name (we don't specify name in sorting)
  scope :sort_by_collectioner_name, -> (name) do
    p self.joins(:collectioner)
    self.joins(:collectioner).reorder("first_name ASC")
  end

  private

  # set "is_live" to false when first created if not specified
  def default_values
    self.is_live ||= false
  end
end
