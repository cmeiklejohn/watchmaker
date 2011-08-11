# encoding: UTF-8

Watchmaker.learn :two_garages do
  2.times do 
    Factory.create(:garage)
  end
end

Watchmaker.learn :garage, :factories => [:garage]

Watchmaker.learn :car, :factories => [:car], :watchmakers => [:garage]

Watchmaker.learn :car_in_garage, :factories => [:garage, :car] do |garage, car|
  garage.cars << car
end
