class Interview < ActiveRecord::Base
  belongs_to :collection

  validates :answer, presence: true
  validates :placement, presence: true, uniqueness: { scope: :collection }
end
