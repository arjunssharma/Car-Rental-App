class Car < ApplicationRecord
  has_many :bookings
  before_save :set_price
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 100 }

  #def available?
  #  bookings.empty? || bookings.map(&:starting).min > Date.tomorrow
  #end

  private
  def set_price
    if style == 'SUV'
      self.price = 150
    elsif style == 'Sedan'
      self.price = 125
    elsif style == 'Coupe'
      self.price = 100
    end
  end

end
