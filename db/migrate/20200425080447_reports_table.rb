# frozen_string_literal: true

class ReportsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.text :report_type
      t.date :date
      t.time :time
      t.text :location
      t.text :description
      t.references :guard
      t.timestamps null: false
    end
  end
end
