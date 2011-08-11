# encoding: UTF-8

ActiveRecord::Schema.define do 
  self.verbose = false

  create_table :garages, :force => true do |t|
    t.string :name
    t.string :location
    t.timestamps
  end

  create_table :cars, :force => true do |t|
    t.string :name
    t.integer :garage_id
    t.timestamps
  end
end
