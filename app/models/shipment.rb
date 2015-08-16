class Shipment < ActiveRecord::Base
  belongs_to :user
  has_many :offers, dependent: :destroy

  validates :user, presence: :true

  validates :origin, presence: :true
  validates :destination, presence: :true
  validates :mode_of_transportation, presence: :true
  validates :equipment_type, presence: :true
  validates :minimum_commitment, presence: :true
  validates :maximum_commitment, presence: :true
  validates :cost, presence: :true
  validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}

  def formatted_price
    price_in_dollars = cost.to_f / 100
    format("%.2f", price_in_dollars)
  end

end
