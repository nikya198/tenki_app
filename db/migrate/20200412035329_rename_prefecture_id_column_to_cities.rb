class RenamePrefectureIdColumnToCities < ActiveRecord::Migration[5.1]
  def change
    rename_column :cities, :prefectureId, :prefecture_id
  end
end
