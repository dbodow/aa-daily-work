# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord

  STATUSES = ['PENDING', 'APPROVED', 'DENIED']

  validates :status, inclusion: { in: STATUSES }
  validates :cat_id, :start_date, :end_date, presence: true

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.where(<<-SQL, id, cat_id, start_date, end_date)
      id != ?
        AND
      cat_id = ?
        AND
      end_date >= ?
        AND
      start_date <= ?
    SQL
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      self.errors[:overlapping] << "dates overlapping"
    end
  end

  def approve!
    transaction do
      overlapping_pending_requests.each { |request| request.deny! }
      self.update(status: 'APPROVED')
      # save!
    end
  end

  def deny!
    self.update(status: 'DENIED')
    save!
  end

  def pending?; end

  validate :does_not_overlap_approved_request
end
