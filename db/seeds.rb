# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create :name => 'admin', :password => 'password', :email => 'admin@car.com', :user_type => 0

User.create :name => 'admin1', :password => 'password', :email => 'admin1@car.com', :user_type => 1
User.create :name => 'admin2', :password => 'password', :email => 'admin2@car.com', :user_type => 1

User.create :name => 'user1', :password => 'password', :email => 'user1@car.com', :user_type => 2
User.create :name => 'user2', :password => 'password', :email => 'user2@car.com', :user_type => 2

Car.create  :model => 'X1 F48', :description => 'Launched in 2015.', :license_number => 'ABC9898', :manufacturer => 'BMW', :style => 'SUV', :price => 25.0, :status => 'Available', :location => 'Raleigh'
Car.create  :model => 'Viper 3rd Gen', :description => 'Coupe by Dodge(USA)..', :license_number => 'DEF9998', :manufacturer => 'Dodge', :style => 'Coupe', :price => 20.0, :status => 'Available', :location => 'San Francisco'
Car.create  :model => 'Civic 10th Gen', :description => 'Sleek looking.', :license_number => 'AHH7867', :manufacturer => 'Honda', :style => 'Sedan', :price => 25.0, :status => 'Available', :location => 'Raleigh'
Car.create  :model => 'Caprice PPV', :description => 'Launched in 2012.', :license_number => 'PLC9898', :manufacturer => 'Chevrolet', :style => 'Sedan', :price => 35.0, :status => 'Available', :location => 'Los Angeles'
Car.create  :model => 'Cruze 2nd Gen', :description => 'Launched in 2016.', :license_number => 'YHC9698', :manufacturer => 'Chevrolet', :style => 'Sedan', :price => 25.0, :status => 'Available', :location => 'Raleigh'
Car.create  :model => 'X3 G01', :description => 'Launched in 2017.', :license_number => 'TTC5898', :manufacturer => 'BMW', :style => 'SUV', :price => 15.0, :status => 'Available', :location => 'Texas'
=begin
4.times do
  3.times do
    name = Faker::Name.last_name
    content = Faker::Lorem.sentence(5)

    Car.create!(name:  name,
                comfort_class: 'B',
                description: content
    )
  end
  3.times do
    name = Faker::Name.last_name
    content = Faker::Lorem.sentence(5)

    Car.create!(name:  name,
                comfort_class: 'C',
                description: content
    )
  end
  3.times do
    name = Faker::Name.last_name
    content = Faker::Lorem.sentence(5)

    Car.create!(name:  name,
                comfort_class: 'A',
                description: content
    )
  end
end

cars = Car.order(:created_at).take(20)
cars.each do |car|
  name  = Faker::Name.name
  phone = Faker::PhoneNumber.cell_phone
  starting = Faker::Date.between(Date.tomorrow, 1.year.from_now)
  ending = Faker::Date.between(starting + 1, starting + 1.month)
  car.bookings.create!(starting: starting, ending: ending, client: name, place: 'New York, 55 East 52nd Street', phone: phone)
end
=end
