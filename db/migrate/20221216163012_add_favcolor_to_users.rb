class AddFavcolorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :favcolor, :string
  end
end