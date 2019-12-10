class Addcolumnimage < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :wardId, :string
  end
end
