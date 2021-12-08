# frozen_string_literal: true

class AddNumberColumnToGuards < ActiveRecord::Migration[6.1]
  def up
    change_column :guards, :number, :text
  end
end
