class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_time, :presence => true
  validates :end_time, :presence => true

  validates :booking_duration_check, inclusion: { in: 1..10, message: 'Please choose between 1 hour and 10 hours' }

  validate :date_range, on: :create
  validate :date_range_edit, on: :update

  def booking_duration_check
    print :start_time
    print :end_time
    ( Time.parse(end_time.to_s) - Time.parse(start_time.to_s) ) / 3600
  end

  private
  def date_range_edit
    unless Booking.where('car_id = ?  AND status <2 AND id <> ? AND ((start_time <= ? AND end_time >= ?) OR (start_time >= ? AND end_time <= ?) OR (start_time <= ? AND end_time >= ?))',
                         car_id, id, start_time, start_time,
                         start_time, end_time, end_time, end_time).empty?
      errors.add(:base, 'Car is unavailable, choose other dates')
    end
  end

  def date_range
    unless Booking.where('car_id = ? AND status <2 AND ((start_time <= ? AND end_time >= ?) OR (start_time >= ? AND end_time <= ?) OR (start_time <= ? AND end_time >= ?))',
                         car_id, start_time, start_time,
                         start_time, end_time, end_time, end_time).empty?
      errors.add(:base, 'Car is unavailable, choose other dates')
    end
  end
end
