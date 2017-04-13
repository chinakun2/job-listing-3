class AddIsHiddenToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :is_hidden, :boolean, default: true
  end
end
