# encoding: UTF-8

require 'spec_helper'

Factory.define :garage do |garage|
  garage.sequence(:name) { |n| "name-#{n}" }
  garage.sequence(:location) { |n| "location-#{n}" }
end

Factory.define :car do |car|
  car.sequence(:name) { |n| "name-#{n}" }
end
