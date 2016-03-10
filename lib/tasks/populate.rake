namespace :populate do
  require 'populator'
  require 'faker'

  desc 'Seed Cars'
  task cars: :environment do
    cars = {
      chevrolet: ['Silverado', 'Malibu', 'Camero'],
      ford: ['Focus RS', 'F-150', 'Mustang'],
      toyota: ['Supra', 'MR-2', 'Tacoma'],
      honda: ['S2000', 'Civic Si', 'Integra Type R']
    }

    Car.populate 200 do |car|
      make = cars.keys.sample
      model = cars[make].sample
      year = Faker::Date.between(20.years.ago, Date.today).year

      car.make = make.to_s.capitalize
      car.model = model
      car.year = year
    end
  end
end
