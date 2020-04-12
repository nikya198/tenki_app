class Addcolumnimage < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :ward_id, :string
    add_column :cities, :prefecture_id, :string
  end
end
