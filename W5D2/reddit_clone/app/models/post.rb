class Post < ApplicationRecord
  validates :title, :author_id, presence: true

  has_many :post_subs, inverse_of: :post, dependent: :destroy

  belongs_to :author,
  class_name: :User

  has_many :subs,
  through: :post_subs,
  source: :sub
end
