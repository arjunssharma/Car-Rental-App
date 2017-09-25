class Car < ApplicationRecord
  has_many :bookings
  #before_save :set_price
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 100 }

  #def available?
  #  bookings.empty? || bookings.map(&:starting).min > Date.tomorrow
  #end

  private
=begin
  def set_price
    if comfort_class == 'A'
      self.price = 100
    elsif comfort_class == 'B'
      self.price = 75
    elsif comfort_class == 'C'
      self.price = 50
    end
  end
=end

end
