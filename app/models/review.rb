class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, inclusion: {in: 1..5}
  validate :has_rating_or_description?

  def has_rating_or_description?
    if rating == nil || description == nil
      errors.add(:rating, "needs a rating or a description")
      errors.add(:description, "needs a rating or a description")
    end
  end

end
