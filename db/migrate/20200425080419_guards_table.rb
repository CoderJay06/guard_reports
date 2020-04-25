class GuardsTable < ActiveRecord::Migration
  def change
    create_table :guards do |t|
      t.string :name
      t.string :email
      t.integer :number
      t.string :password_digest
      t.string :location 
      t.string :company 
    end 
  end
end
