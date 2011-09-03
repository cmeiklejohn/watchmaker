# encoding: UTF-8

require 'spec_helper'

describe Garage do 

  describe "when using the builder" do 
    it "should build some garages from the lambda based watchmaker" do
      Watchmaker.build(:two_garages).count.should == 2
      Garage.all.count.should == 0
    end
  end

  describe "when using the creator" do 
    it "should create some garages from the lambda based watchmaker" do
      Watchmaker.create(:two_garages)
      Garage.all.count.should == 2
    end

    it "should the result of the lambda evaluation when constructing that way" do
      Watchmaker.create(:two_cars).first.should == 2
      Car.all.count.should == 2
    end

    it "should create a garage from the factory based watchmaker" do 
      Watchmaker.create(:garage)
      Garage.all.count.should == 1
    end

    it "return the objects created from a watchmaker" do
      Watchmaker.create(:garage).first.should == Garage.first
    end

    it "should create a garage and it's from the factory based watchmaker" do 
      Watchmaker.create(:car_in_garage).map do |o| 
        o.class.to_s 
      end.should == ["Garage", "Car", "Array"]

      Car.all.count.should == 1
      Garage.all.count.should == 1
      Garage.first.cars.should include(Car.first)
    end

    it "should create a car from the watchmaker based watchmaker" do 
      Watchmaker.create(:car_with_garage).first.should be_a_kind_of Car
      Car.all.count.should == 1
      Garage.all.count.should == 1
    end

    it "should be able to use the new syntax to build based on factories or watchmakers" do 
      Watchmaker.create(:two_cars_and_two_garages)
      Garage.all.count.should == 2
      Car.all.count.should == 2
      Garage.last.cars.count.should == 2
    end
  end

  describe "when using the legacy syntax" do 
    it "should build some garages from the lambda based watchmaker" do
      Watchmaker.assemble(:two_garages).count.should == 2
      Garage.all.count.should == 0
    end

    it "should create some garages from the lambda based watchmaker" do
      Watchmaker.construct(:two_garages)
      Garage.all.count.should == 2
    end
  end

end
