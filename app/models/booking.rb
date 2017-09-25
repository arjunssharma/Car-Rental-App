class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user


  validates :must_be_between_two_and_ten_hours, inclusion: { in: 2..10, message: '- Choose between 2 hours and 10 hours' }
  validates :email_id, presence: true, length: { maximum: 30 }
  validates :place, presence: true
  validates :phone, presence: true, length: { maximum: 15 }
  validate :date_range, on: :create
  validate :date_range_edit, on: :update

  def must_be_between_two_and_ten_hours
    ( Time.parse(end_time.to_s) - Time.parse(start_time.to_s) ) / 3600
  end

  private
  def remove_bookings
    where { end_time < Date.today }.destroy_all if where { end_time < Date.today }.any?
  end

  def date_range_edit
    unless Booking.where('car_id = ? AND id <> ? AND ((start_time <= ? AND end_time >= ?) OR (start_time >= ? AND end_time <= ?) OR (start_time <= ? AND end_time >= ?))',
                         car_id, id, start_time, start_time,
                         start_time, end_time, end_time, end_time).empty?
      errors.add(:base, 'Car is unavailable, choose other dates')
    end
  end

  def date_range
    unless Booking.where('car_id = ? AND ((start_time <= ? AND end_time >= ?) OR (start_time >= ? AND end_time <= ?) OR (start_time <= ? AND end_time >= ?))',
                         car_id, start_time, start_time,
                         start_time, end_time, end_time, end_time).empty?
      errors.add(:base, 'Car is unavailable, choose other dates')
    end
  end
end
