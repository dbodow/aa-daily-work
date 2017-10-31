class PostSub < ApplicationRecord
  validates :post_id, :sub_id, presence: true
  validates :post_id, uniqueness: { scope: :sub_id }

  belongs_to :post
  belongs_to :sub
end
