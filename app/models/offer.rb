class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :shipment, touch: true

  # => amount: integer
  validates :amount, presence: true, numericality: { only_integer: true }
  # => user_id: integer
  validates :user_id, presence: true
  validates_associated :user
  # => shipment_id: integer
  validates :shipment_id, presence: true
  validates_associated :shipment

  

  def set_user(user)
    self.user_id = user.id
  end
end
