# encoding: UTF-8

require 'spec_helper'

describe Garage do 
  it "should create some garages from the lambda based watchmaker" do
    Watchmaker.construct(:two_garages)
    Garage.all.count.should == 2
  end

  it "should the result of the lambda evaluation when constructing that way" do
    Watchmaker.construct(:two_cars).first.should == 2
    Car.all.count.should == 2
  end

  it "should create a garage from the factory based watchmaker" do 
    Watchmaker.construct(:garage)
    Garage.all.count.should == 1
  end

  it "return the objects created from a watchmaker" do
    Watchmaker.construct(:garage).first.should == Garage.first
  end

  it "should create a garage and it's from the factory based watchmaker" do 
    Watchmaker.construct(:car_in_garage).map do |o| 
      o.class.to_s 
    end.should == ["Garage", "Car", "Array"]

    Car.all.count.should == 1
    Garage.all.count.should == 1
    Garage.first.cars.should include(Car.first)
  end

  it "should create a car from the watchmaker based watchmaker" do 
    Watchmaker.construct(:car).first.should be_a_kind_of Car
    Car.all.count.should == 1
    Garage.all.count.should == 1
  end
end
