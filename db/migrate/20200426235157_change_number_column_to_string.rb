# frozen_string_literal: true

class ChangeNumberColumnToString < ActiveRecord::Migration
  def change
    change_column :guards, :number, :string
  end
end
