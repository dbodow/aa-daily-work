class Sub < ApplicationRecord
  validates :title, :moderator_id, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator,
  class_name: :User

  has_many :post_subs, inverse_of: :sub, dependent: :destroy

  has_many :posts,
  through: :post_subs,
  source: :post
end
