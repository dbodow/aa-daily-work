class Goal < ApplicationRecord
  validates :user_id, :body, :private, presence: true

  belongs_to :user
end
