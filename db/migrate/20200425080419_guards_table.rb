# frozen_string_literal: true

class GuardsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :guards do |t|
      t.text :name
      t.text :email
      t.text :number
      t.text :password_digest
      t.text :company
      
      t.timestamps null: false
    end
  end
end
