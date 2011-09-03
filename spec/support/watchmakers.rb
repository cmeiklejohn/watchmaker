# encoding: UTF-8

Watchmaker.learn :two_garages do
  2.times do 
    Factory.create(:garage)
  end
end

Watchmaker.learn :two_cars do
  2.times do 
    Factory.create(:car)
  end
end

Watchmaker.define :garage, :factories => [:garage]

Watchmaker.define :car_with_garage, :factories => [:car], :watchmakers => [:garage]

Watchmaker.define :car_in_garage, :factories => [:garage, :car] do |garage, car|
  garage.cars << car
end

Watchmaker.define :two_garages, :factories => [:garage, :garage]

Watchmaker.define :two_cars_and_two_garages => [:two_garages, :car, :car] do |garages, car1, car2| 
  garages.each do |garage|
    garage.cars << car1
    garage.cars << car2
  end
end
