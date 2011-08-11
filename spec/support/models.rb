# encoding: UTF-8

class Garage < ActiveRecord::Base
  has_many :cars 
end

class Car < ActiveRecord::Base
  belongs_to :garage
end
