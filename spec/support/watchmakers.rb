Watchmaker.learn :two_garages do
  @garage1 = Factory.create(:garage)
  @garage2 = Factory.create(:garage)

  [@garage1, @garage2]
end

Watchmaker.learn :garage, :factories => [:garage]

Watchmaker.learn :car, :factories => [:car], :watchmakers => [:garage]

Watchmaker.learn :garage_and_car, :factories => [:garage, :car] do |objects| 
  @garage = objects.first
  @car    = objects.last

  @garage.cars << @car
end
