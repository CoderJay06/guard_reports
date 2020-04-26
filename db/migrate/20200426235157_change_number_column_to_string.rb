class ChangeNumberColumnToString < ActiveRecord::Migration
  def change
    change_column :guards, :number, :string
  end
end
