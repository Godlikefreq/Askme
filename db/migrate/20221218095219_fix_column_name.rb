class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :favcolor, :favorite_color
  end
end
