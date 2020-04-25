class ReportsTable < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :type 
      t.date :date
      t.time :time
      t.string :location
      t.string :description
    end 
  end
end
