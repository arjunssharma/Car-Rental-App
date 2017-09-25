# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Car.create!(name: 'Maruti', description: 'Year: 1999, Engine: 0, Horsepower: 20')

Car.create!(name: 'Omni', description: 'Year: 2002')

Car.create!(name: 'Toyota', description: 'Year: 2014, Fuel: Gasoline')

2.times do
  2.times do
    carName = Faker::Name.name
    description = Faker::Lorem.sentence(3)
    Car.create!(name:  carName, description: description)
  end
  2.times do
    carName = Faker::Name.name
    description = Faker::Lorem.sentence(3)
    Car.create!(name:  carName, description: description)
  end
  2.times do
    carName = Faker::Name.name
    description = Faker::Lorem.sentence(3)
    Car.create!(name:  carName, description: description)
  end
end

cars = Car.order(:created_at).take(20)
cars.each do |car|
  start_date = Faker::Date.between(Date.tomorrow, 1.year.from_now)
  phone = Faker::PhoneNumber.cell_phone
  end_date = Faker::Date.between(start_date + 1, start_date + 1.month)
  car.bookings.create!(start_time: start_date, end_time: end_date, email_id: "asharm33@ncsu.edu", place: 'Mumbai', phone: phone)
end
