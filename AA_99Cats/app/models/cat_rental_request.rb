class CatRentalRequest < ApplicationRecord
  STATUS = ['APPROVED', 'PENDING', 'DENIED']

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUS }
  validate :does_not_overlap_approved_request
  validate :start_before_end

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
      .where('cat_id = ?', self.cat_id)
      .where.not('start_date > ?', self.end_date)
      .where.not('end_date < ?', self.start_date)
  end

  def overlapping_approved_requests
    self.overlapping_requests.where('status = ?', 'APPROVED')
  end

  def does_not_overlap_approved_request
    overlap = self.overlapping_approved_requests    
    if overlap.exists?
      errors[:message] << "another rental already made!"
    end
  end

  def start_before_end
    if self.start_date > self.end_date
      errors[:message] << "dates are invalid!"
    end
  end
end