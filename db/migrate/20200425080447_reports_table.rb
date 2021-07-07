class ReportsTable < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report_type
      t.integer :guard_id
      t.date :date
      t.time :time
      t.string :location
      t.text :description

      t.timestamps null: false
    end
  end
end
