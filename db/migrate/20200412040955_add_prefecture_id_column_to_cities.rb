class AddPrefectureIdColumnToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :prefecture_id, :string
  end
end
